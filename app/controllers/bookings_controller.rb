class BookingsController < ApplicationController
  def create
    @beast = Beast.find(params[:beast_id])
    @booking = Booking.new(booking_params)
    @booking.beast = @beast
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to beast_path(@beast)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @beast = Beast.find(params[:beast_id])
    @booking = Booking.new
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :beast_id)
  end
end
