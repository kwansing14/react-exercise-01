class ClockoutsController < ApplicationController
  before_action :set_clockout, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /clockouts
  # GET /clockouts.json
  def index
    @clockouts = Clockout.all
  end

  # GET /clockouts/1
  # GET /clockouts/1.json
  def show
  end

  # GET /clockouts/new
  def new
    @clockout = Clockout.new
  end

  # GET /clockouts/1/edit
  def edit
  end

  # POST /clockouts
  # POST /clockouts.json
  def create
    @clockout = Clockout.new(clockout_params)

    respond_to do |format|
      if @clockout.save
        format.html { redirect_to @clockout, notice: 'Clockout was successfully created.' }
        format.json { render :show, status: :created, location: @clockout }
      else
        format.html { render :new }
        format.json { render json: @clockout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clockouts/1
  # PATCH/PUT /clockouts/1.json
  def update
    respond_to do |format|
      if @clockout.update(clockout_params)
        format.html { redirect_to @clockout, notice: 'Clockout was successfully updated.' }
        format.json { render :show, status: :ok, location: @clockout }
      else
        format.html { render :edit }
        format.json { render json: @clockout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clockouts/1
  # DELETE /clockouts/1.json
  def destroy
    @clockout.destroy
    respond_to do |format|
      format.html { redirect_to clockouts_url, notice: 'Clockout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clockout
      @clockout = Clockout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clockout_params
      params.require(:clockout).permit(:location, :user_id)
    end
end