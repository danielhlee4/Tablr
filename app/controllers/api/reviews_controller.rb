class Api::ReviewsController < ApplicationController
  before_action :require_login, except: [:index]
  
  def index
    @reviews = Review.includes(reservation: :user)
    render :index
  end

  def create
    @review = Review.new(review_params)
  
    @review.user = current_user
    @review.reservation = current_user.reservations.find_by(id: review_params[:reservation_id])
    
    if @review.reservation.nil?
      render json: { error: "Reservation not found or doesn't belong to the current user" }, status: :not_found
      return
    end
  
    if @review.save
      render :show
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private

  def require_login
    unless current_user
      render json: { error: 'You must be logged in to access this section' }, status: :unauthorized
    end
  end

  def review_params
    params.require(:review).permit(:overall_rating, :food_rating, :service_rating, :ambiance_rating, :value_rating, :body, :reservation_id, :restaurant_id)
  end
end
