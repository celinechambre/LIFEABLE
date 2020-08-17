class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
  end

  private

  def set_life
    @life = Life.find(params[:life_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  
end
