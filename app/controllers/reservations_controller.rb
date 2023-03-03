class ReservationsController < ApplicationController
  before_action :set_planet, only: %i[create]

  def index
    @reservations = Reservation.where(user_id: current_user)
    @passed_reservations = []
    @ongoing_reservations = []
    @coming_reservations = []
    @reservations.each do |reservation|
      if reservation.end_date < Date.today
        @passed_reservations << reservation
      elsif reservation.start_date > Date.today
        @coming_reservations << reservation
      else
        @ongoing_reservations << reservation
      end
    end
    @coming_reservations.sort! { |a, b| a.start_date <=> b.start_date }
    @ongoing_reservations.sort! { |a, b| a.start_date <=> b.start_date }
    @passed_reservations.sort! { |a, b| a.start_date <=> b.start_date }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.planet = @planet
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_planets_path
    else
      render 'planets/show', status: :unprocessable_entity
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
