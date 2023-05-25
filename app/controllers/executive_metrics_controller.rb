class ExecutiveMetricsController < ApplicationController
  before_action :set_executive_metric, only: %i[ show edit update destroy ]

  # GET /executive_metrics or /executive_metrics.json
  def index
    @executive_metrics = ExecutiveMetric.all
    @executives = Executive.all
    @open_counts = @executive_metrics.where(type_of_metric: "open").group(:executive_id).count
    @close_counts =  @executive_metrics.where(type_of_metric: "closed").group(:executive_id).count
    @created_counts = @executive_metrics.where(type_of_metric: "create").group(:executive_id).count
    @evaluation_average = @executive_metrics.where(type_of_metric: "Evaluation").group(:executive_id).average(:evaluation)
  end

  # GET /executive_metrics/1 or /executive_metrics/1.json
  def show
    @executive_metric = ExecutiveMetric.find(params[:id])
  end

  # GET /executive_metrics/new
  def new
    @executive_metric = ExecutiveMetric.new
  end

  # GET /executive_metrics/1/edit
  def edit
  end

  # POST /executive_metrics or /executive_metrics.json
  def create
    @executive_metric = ExecutiveMetric.new(executive_metric_params)

    respond_to do |format|
      if @executive_metric.save
        format.html { redirect_to executive_metric_url(@executive_metric), notice: "Executive metric was successfully created." }
        format.json { render :show, status: :created, location: @executive_metric }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @executive_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executive_metrics/1 or /executive_metrics/1.json
  def update
    respond_to do |format|
      if @executive_metric.update(executive_metric_params)
        format.html { redirect_to executive_metric_url(@executive_metric), notice: "Executive metric was successfully updated." }
        format.json { render :show, status: :ok, location: @executive_metric }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @executive_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executive_metrics/1 or /executive_metrics/1.json
  def destroy
    @executive_metric.destroy

    respond_to do |format|
      format.html { redirect_to executive_metrics_url, notice: "Executive metric was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_executive_metric
      @executive_metric = ExecutiveMetric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def executive_metric_params
      params.fetch(:executive_metric, {})
    end
end
