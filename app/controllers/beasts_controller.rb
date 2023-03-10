class BeastsController < ApplicationController
  def index
      if params[:query].present?
        @beasts = policy_scope(Beast.search_by_name_race_tags(params[:query]))
      else
        @beasts = policy_scope(Beast)
      end
    @markers = @beasts.geocoded.map do |beast|
      {
        lat: beast.latitude,
        lng: beast.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { beast: beast }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @user = current_user
    @beast = Beast.find(params[:id])
    @booking = Booking.new
    authorize @beast
  end

  def new
    @beast = Beast.new
    authorize @beast
  end

  def create
    @user = current_user
    @beast = Beast.new(beasts_params)
    @beast.user = @user
    authorize @beast
    if @beast.save
      redirect_to beast_path(@beast)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @beast = Beast.find(params[:id])
    authorize @beast
    @beast.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def beasts_params
    params.require(:beast).permit(:race, :price_per_day, :danger_gauge, :name, :address, :description, photos: [], tags: [])
  end
end
