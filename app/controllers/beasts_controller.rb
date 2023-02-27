class BeastsController < ApplicationController
  def index
    @beasts = Beast.all
  end

  def show
    @user = current_user
    @beast = Beast.find(params[user_id])
  end

  def new
    @beast = Beast.new
  end

  def create
    @user = current_user
    @beast = Beast.new(beasts_params)
    @beast.user = @user
    if @beast.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @beast = Beast.find(params[:id])
    @beast.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def beasts_params
    params.require(:beasts).permit(:race, :tags, :price_per_day, :danger_gauge)
  end
end
