class BookingsController < ApplicationController

# skip_before_action :authenticate_user!
  def index
    @bookings = policy_scope(Booking)
    @bookings = current_user.bookings.all
    # authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
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
    authorize @booking
    @booking.life = @life
    @booking.user = @user
    @booking.save
    authorize @booking
    if @booking.save!
      # Life.create!(title: life_params.title, description: life_params.description, user_id: current_user.id)
      redirect_to booking_path(@booking)
    else
      render :new
    end
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
