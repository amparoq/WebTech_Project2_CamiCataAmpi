class ExecutivesController < ApplicationController
  before_action :set_executive, only: %i[ show edit update destroy ]

  # GET /executives or /executives.json
  def index
    @executives = Executive.all
  end

  # GET /executives/1 or /executives/1.json
  def show
    @executive = Executive.find(params[:id])
    @user = @executive.user
    @tickets = @executive.tickets
    @month = Date.today.beginning_of_month
    @total_tickets_received = @executive.total_tickets_received_in_month(@month)
    @total_open_tickets = @executive.total_open_tickets_in_month(@month)
    @total_closed_tickets = @executive.total_closed_tickets_in_month(@month)
    @open_tickets_by_priority = @executive.open_tickets_by_priority_in_month(@month)
    @closed_tickets_by_priority = @executive.closed_tickets_by_priority_in_month(@month)
  end

  # GET /executives/new
  def new
    @executive = Executive.new
  end

  # GET /executives/1/edit
  def edit
  end

  # POST /executives or /executives.json
  def create
    @executive = Executive.new(executive_params)

    respond_to do |format|
      if @executive.save
        format.html { redirect_to executive_url(@executive), notice: "Executive was successfully created." }
        format.json { render :show, status: :created, location: @executive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executives/1 or /executives/1.json
  def update
    respond_to do |format|
      if @executive.update(executive_params)
        format.html { redirect_to executive_url(@executive), notice: "Executive was successfully updated." }
        format.json { render :show, status: :ok, location: @executive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executives/1 or /executives/1.json
  def destroy
    @executive.destroy

    respond_to do |format|
      format.html { redirect_to executives_url, notice: "Executive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_executive
      @executive = Executive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def executive_params
      params.fetch(:executive, {})
    end
end
