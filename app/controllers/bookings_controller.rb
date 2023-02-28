class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.beast = @beast
    if @booking.save
      redirect_to beast_path(@beast)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :beast_id)
  end
end
