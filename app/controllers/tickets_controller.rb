class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    if current_user.requiring_user? || current_user.executive?
      @user = User.find(params[:user_id])
      if @user.requiring_user?
        @tickets = @user.requiring_user_tickets
      end
      if @user.executive?
        @tickets = @user.executive_tickets
      end
    else
      @tickets = Ticket.all
    end
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments.sort_by(&:created_at)
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

    executive_users = User.executive.joins(:executive_tickets).group('users.id').order('COUNT(tickets.id) ASC')
    executive_id = executive_users.first.id
    @ticket = Ticket.create(title: title, description: description, creation_date: creation_date, deadline_date: deadline_date, state: "open", priority: priority, executive_id: executive_id, requiring_user_id: requiring_user_id)
    tags = params[:tags]
    if tags.present?
      tags.each do |tag|
        TagsTicket.create(ticket_id: @ticket.id, tag_id: tag)
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

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
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
