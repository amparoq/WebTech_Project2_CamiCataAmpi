class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show edit update destroy ]

  # GET /responses or /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1 or /responses/1.json
  def show
    @response = Response.find(params[:id])
  end

  # GET /responses/new
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses or /responses.json
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @executive_id = current_user.id
    @response = Response.create(response: response_params[:response], acceptance: false, rejected: false, ticket_id: @ticket.id, executive_id: @executive_id, requiring_user_id: @ticket.requiring_user_id)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @ticket, notice: "Response was successfully created." }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1 or /responses/1.json
  def update
    @ticket = Ticket.find(params[:ticket_id])
    @responses = @ticket.responses.where('rejected = false AND acceptance = false')
    if params[:commit] == "Send evaluation"
      @responses.each do |response|
        response.acceptance = true
        response.evaluation = params[:evaluation]
        response.save
      end
      @ticket.resolution_date = Date.today
      @ticket.state = "closed"
      @ticket.save
    end

    if params[:commit] == "Yes, I am sure"
      @responses.each do |response|
        response.rejected = true
        response.save
      end
    end
  
    respond_to do |format|
      format.html { redirect_to @ticket, notice: "Responses were successfully updated." }
      format.json { render :show, status: :ok, location: @responses.first }
    end
  end
  

  # DELETE /responses/1 or /responses/1.json
  def destroy
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url, notice: "Response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.fetch(:response, {}).permit(:response)
    end
end
