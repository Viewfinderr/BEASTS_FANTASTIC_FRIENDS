class BookingsController < ApplicationController
  def create
    @beast = Beast.find(params[:beast_id])
    @booking = Booking.new(booking_params)
    @booking.beast = @beast
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @beast = Beast.find(params[:beast_id])
    @booking = Booking.new
    authorize @booking
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "declined"
    @booking.save
    redirect_to dashboard_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "canceled"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :beast_id)
  end
end
