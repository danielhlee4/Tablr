class Api::ReviewsController < ApplicationController
  before_action :require_login
  
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.includes(:user)
    
    render :index
  end

  def create
    reservation = current_user.reservations.find_by(id: review_params[:reservation_id])
    
    if reservation.nil?
      render json: { error: "Reservation not found or doesn't belong to the current user" }, status: :not_found
      return
    end

    @review = reservation.build_review(review_params.except(:reservation_id))

    if @review.save
      render :show
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless current_user
      render json: { error: 'You must be logged in to access this section' }, status: :unauthorized
    end
  end

  def review_params
    params.require(:review).permit(:overall_rating, :food_rating, :service_rating, :ambiance_rating, :value_rating, :body, :reservation_id)
  end
end
