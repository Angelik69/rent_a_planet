class ReservationsController < ApplicationController
  before_action :set_planet

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.planet = @planet
    @reservation.user = curent_user
    if @reservation.save
      redirect_to planet_path(@planet)
    else
      render 'planets/show', status: :unprocessable_entity
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
