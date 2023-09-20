class Api::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render json
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render json
  end

  # private

  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :description, :cuisine, :expense, :price_range, :neighborhood, :address, :phone, :website_url)
  # end
end
