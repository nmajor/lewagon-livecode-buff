class MeritsController < ApplicationController
  before_action :set_merit, only: [:show, :edit, :update, :destroy]

  # GET /merits
  # GET /merits.json
  def index
    @merits = Merit.all
  end

  # GET /merits/1
  # GET /merits/1.json
  def show
  end

  # GET /merits/new
  def new
    @merit = Merit.new
  end

  # GET /merits/1/edit
  def edit
  end

  # POST /merits
  # POST /merits.json
  def create
    @merit = Merit.new(merit_params)

    respond_to do |format|
      if @merit.save
        format.html { redirect_to @merit, notice: 'Merit was successfully created.' }
        format.json { render :show, status: :created, location: @merit }
      else
        p @merit.errors.messages
        format.html { render :new }
        format.json { render json: @merit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merits/1
  # PATCH/PUT /merits/1.json
  def update
    respond_to do |format|
      if @merit.update(merit_params)
        format.html { redirect_to @merit, notice: 'Merit was successfully updated.' }
        format.json { render :show, status: :ok, location: @merit }
      else
        format.html { render :edit }
        format.json { render json: @merit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merits/1
  # DELETE /merits/1.json
  def destroy
    @merit.destroy
    respond_to do |format|
      format.html { redirect_to merits_url, notice: 'Merit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merit
      @merit = Merit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merit_params
      params.require(:merit).permit(:group_id, :name, :points, :remote_image_url)
    end
end
