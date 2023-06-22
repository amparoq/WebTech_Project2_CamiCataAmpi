class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    if current_user.requiring_user? || current_user.executive?
      @user = current_user
      if @user.requiring_user?
        @tickets = @user.requiring_user_tickets
      end
      if @user.executive?
        @tickets = @user.executive_tickets
        @other_tickets = Ticket.all - @tickets
      end
    else
      @tickets = Ticket.all
    end
  end

  def index_others
    @tickets = Ticket.where.not(executive_id: current_user.id)
  end
  # tickets_controller.rb
  def search
    query = params[:query]
    
    @tickets = []

    if current_user.executive? || current_user.supervisor? || current_user.administrator?
      @tickets += Ticket.where("title LIKE ?", "%#{query}%")
      @tickets += Ticket.where("description LIKE ?","%#{query}%")
      @tickets += Ticket.joins(:requiring_user).where("email LIKE ?","%#{query}%")
    else
      @tickets += Ticket.where("title LIKE ?", "%#{query}%").where(requiring_user_id: current_user.id)
      @tickets += Ticket.where("description LIKE ?","%#{query}%").where(requiring_user_id: current_user.id)
      @tickets += Ticket.joins(:requiring_user).where("email LIKE ?","%#{query}%").where(requiring_user_id: current_user.id)
    end
    
    render json: @tickets
  end
  

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments.sort_by(&:created_at)
    @comment = Comment.new
    @attachments = @ticket.attachments
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    title = params[:title]
    description = params[:description]
    requiring_user_id = current_user.id
    priority = params[:priority]
    creation_date = Date.today
    deadline_date = nil
  
    if priority == '1'   
      deadline_date = creation_date + 3
    elsif priority == '2'
      deadline_date = creation_date + 5
    elsif priority == '3'
      deadline_date = creation_date + 7
    end
  
    executive_users = User.executive.left_outer_joins(:executive_tickets).group('users.id').order('COUNT(tickets.id) ASC')
    executive = executive_users.first
    executive_id = executive.present? ? executive.id : nil
    @ticket = Ticket.new(title: title, description: description, creation_date: creation_date, deadline_date: deadline_date, state: "open", priority: priority, executive_id: executive_id, requiring_user_id: requiring_user_id)
    
    tags = params[:tags]
    if tags.present?
      tags.each do |tag|
        @ticket.tags_tickets.build(tag_id: tag)
      end
    end
  
    if params[:ticket][:attachments].present?
      params[:ticket][:attachments].each do |attachment|
        next if attachment.blank? || !attachment.is_a?(ActionDispatch::Http::UploadedFile)
  
        title = attachment.original_filename
        blob = ActiveStorage::Blob.create_and_upload!(
          io: attachment.open,
          filename: attachment.original_filename,
          content_type: attachment.content_type
        )
  
        @ticket.attachments.attach(blob)
        blob.update(metadata: { title: title })
      end
    end
  
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    if params[:ticket][:commit] == "newInCharge"
      executive_new = User.find(params[:ticket][:new_in_charge])
      puts executive_new
      @ticket.executive_id = executive_new.id
      respond_to do |format|
        if @ticket.save
          format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
          format.json { render :show, status: :ok, location: @ticket }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end

    else
      @ticket.tags.clear
      selected_tag_ids = params[:ticket][:tag_ids].reject(&:empty?).map(&:to_i)

      if selected_tag_ids.present?
        selected_tag_ids.each do |tag_id|
          TagsTicket.create(ticket_id: @ticket.id, tag_id: tag_id)
        end
      end

      respond_to do |format|
        if @ticket.update(ticket_params)
          format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
          format.json { render :show, status: :ok, location: @ticket }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def report
    @ticket_tags_data = Ticket.joins(:tags).group('tags.name').count
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]

      @start_date = start_date
      @end_date = end_date

      @tickets_created = Ticket.where(creation_date: start_date..end_date)
      @tickets_open = Ticket.where(creation_date: start_date..end_date, state: 'open')
      @tickets_closed = Ticket.where(creation_date: start_date..end_date, state: 'closed')
    end
  end

  def generate_report
    redirect_to tickets_report_path(start_date: params[:start_date], end_date: params[:end_date])
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
        @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.fetch(:ticket, {}).permit(:title, :description, :priority, attachments: [])
    end
end
