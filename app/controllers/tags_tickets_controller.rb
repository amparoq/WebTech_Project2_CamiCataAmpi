class TagsTicketsController < ApplicationController
  before_action :set_tags_ticket, only: %i[ show edit update destroy ]

  # GET /tags_tickets or /tags_tickets.json
  def index
    @tags_tickets = TagsTicket.all
  end

  # GET /tags_tickets/1 or /tags_tickets/1.json
  def show
    @tagsticket = TagsTicket.find(params[:id])
  end

  # GET /tags_tickets/new
  def new
    @tags_ticket = TagsTicket.new
  end

  # GET /tags_tickets/1/edit
  def edit
  end

  # POST /tags_tickets or /tags_tickets.json
  def create
    @tags_ticket = TagsTicket.new(tags_ticket_params)

    respond_to do |format|
      if @tags_ticket.save
        format.html { redirect_to tags_ticket_url(@tags_ticket), notice: "Tags ticket was successfully created." }
        format.json { render :show, status: :created, location: @tags_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tags_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags_tickets/1 or /tags_tickets/1.json
  def update
    respond_to do |format|
      if @tags_ticket.update(tags_ticket_params)
        format.html { redirect_to tags_ticket_url(@tags_ticket), notice: "Tags ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @tags_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tags_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags_tickets/1 or /tags_tickets/1.json
  def destroy
    @tags_ticket.destroy

    respond_to do |format|
      format.html { redirect_to tags_tickets_url, notice: "Tags ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tags_ticket
      @tags_ticket = TagsTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tags_ticket_params
      params.fetch(:tags_ticket, {})
    end
end
