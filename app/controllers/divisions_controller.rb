class DivisionsController < ApplicationController
  before_action :set_division, only: [:show, :edit, :update, :destroy, :random]

  def today
  end

  def index
    @divisiones = Division.all
  end

  def show
  end

  def new
    @division = Division.new
  end

  def edit
  end

  def create
    @division = Division.new(division_params)

    if @division.save
      redirect_to @division, notice: 'division was successfully created.'
    else
      render :new
    end
  end

  def update
    if @division.update(division_params)
      redirect_to @division, notice: 'division was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @division.destroy
    redirect_to divisiones_url, notice: 'division was successfully destroyed.'
  end

  private
    def set_division
      @division = division.find(params[:id])
    end

    def division_params
      params.require(:division).permit(:number_of_groups)
    end

end
