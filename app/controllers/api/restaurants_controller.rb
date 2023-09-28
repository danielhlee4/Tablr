class Api::RestaurantsController < ApplicationController
  # wrap_parameters include: Restaurant.attribute_names + ['price_range', 'website_url']

  def index
    @restaurants = Restaurant.all
    render :index
  end

  # def index
  #   @restaurants = Restaurant.all.sort { |a,b| b.created_at <=> a.created_at }
  # end

  def show
    @restaurant = Restaurant.find(params[:id])
    render :show
  end

  def search
    query = params[:query]

    @restaurants = Restaurant.where('name ILIKE ?', "%#{query}%")
    # @restaurants = Restaurant.where('name ILIKE ? OR city ILIKE', "%#{query}%")

    render :search
  end

  # private

  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :description, :cuisine, :expense, :price_range, :neighborhood, :address, :phone, :website_url)
  # end
end