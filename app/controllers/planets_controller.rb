class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])
    if @planet.update(planet_params)
      redirect_to planets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy
    redirect_to planets_path
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :description, :price_per_night, :photo)
  end
end
