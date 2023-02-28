class BeastsController < ApplicationController
  def index
    @beasts = Beast.all
    @beast = policy_scope(Beast)
  end

  def show
    @user = current_user
    @beast = Beast.find(params[:id])
    @beast.user = @user
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
      redirect_to root_path
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
    params.require(:beast).permit(:race, :tags, :price_per_day, :danger_gauge)
  end
end
