class ReservationsController < ApplicationController
  before_action :set_planet

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.planet = @planet
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_planets_path
    else
      render 'planets/show', planet: @planet, status: :unprocessable_entity
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :nb_persons)
  end
end

