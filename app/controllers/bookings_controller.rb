class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @life = Life.find(params[:life_id])
    set_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @life = Life.find(params[:life_id])
    set_user
    @booking = Booking.new(booking_params)
    @booking.life = @life
    @booking.user = @user
    @booking.save
    redirect_to life_path(@life)
  end

  private

  def set_life
    @life = Life.find(params[:life_id])
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
