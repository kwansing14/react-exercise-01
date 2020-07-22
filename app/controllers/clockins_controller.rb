class ClockinsController < ApplicationController
  before_action :set_clockin, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /clockins
  # GET /clockins.json
  def index
    @clockins = Clockin.all
  end

  # GET /clockins/1
  # GET /clockins/1.json
  def show
  end

  # GET /clockins/new
  def new
    @clockin = Clockin.new
  end

  # GET /clockins/1/edit
  def edit
  end

  # POST /clockins
  # POST /clockins.json
  def create
    @clockin = Clockin.new(clockin_params)
    respond_to do |format|
      if @clockin.save
        format.html { redirect_to @clockin, notice: 'Clockin was successfully created.' }
        format.json { render :show, status: :created, location: @clockin }
      else
        format.html { render :new }
        format.json { render json: @clockin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clockins/1
  # PATCH/PUT /clockins/1.json
  def update
    respond_to do |format|
      if @clockin.update(clockin_params)
        format.html { redirect_to @clockin, notice: 'Clockin was successfully updated.' }
        format.json { render :show, status: :ok, location: @clockin }
      else
        format.html { render :edit }
        format.json { render json: @clockin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clockins/1
  # DELETE /clockins/1.json
  def destroy
    @clockin.destroy
    respond_to do |format|
      format.html { redirect_to clockins_url, notice: 'Clockin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clockin
      @clockin = Clockin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clockin_params
      params.require(:clockin).permit(:location, :user_id)
    end
end