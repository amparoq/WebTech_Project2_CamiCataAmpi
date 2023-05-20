class RequiringUsersController < ApplicationController
  before_action :set_requiring_user, only: %i[ show edit update destroy ]

  # GET /requiring_users or /requiring_users.json
  def index
    @requiring_users = RequiringUser.all
  end

  # GET /requiring_users/1 or /requiring_users/1.json
  def show
  end

  # GET /requiring_users/new
  def new
    @requiring_user = RequiringUser.new
  end

  # GET /requiring_users/1/edit
  def edit
  end

  # POST /requiring_users or /requiring_users.json
  def create
    @requiring_user = RequiringUser.new(requiring_user_params)

    respond_to do |format|
      if @requiring_user.save
        format.html { redirect_to requiring_user_url(@requiring_user), notice: "Requiring user was successfully created." }
        format.json { render :show, status: :created, location: @requiring_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requiring_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requiring_users/1 or /requiring_users/1.json
  def update
    respond_to do |format|
      if @requiring_user.update(requiring_user_params)
        format.html { redirect_to requiring_user_url(@requiring_user), notice: "Requiring user was successfully updated." }
        format.json { render :show, status: :ok, location: @requiring_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requiring_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requiring_users/1 or /requiring_users/1.json
  def destroy
    @requiring_user.destroy

    respond_to do |format|
      format.html { redirect_to requiring_users_url, notice: "Requiring user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requiring_user
      @requiring_user = RequiringUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requiring_user_params
      params.fetch(:requiring_user, {})
    end
end
