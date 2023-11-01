class Api::ReservationsController < ApplicationController
    before_action :require_login, only: [:create, :update, :destroy, :index]
  
    def index
        @reservations = current_user.reservations
        render :index
    end
  
    def show
        @reservation = Reservation.find(params[:id])
        render :show
    end
  
    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
    
        if @reservation.save
            render :show
        else
            error_messages = @reservation.errors.full_messages.join(', ')
            render json: { errors: error_messages }, status: :unprocessable_entity
        end
    end
    
    def update
        @reservation = Reservation.find(params[:id])
        
        if @reservation.user != current_user
            render json: { error: "You can't modify someone else's reservation." }, status: :forbidden
            return
        end
    
        if @reservation.update(reservation_params)
            render :show
        else
            render json: @reservation.errors.full_messages, status: :unprocessable_entity
        end
    end
  
    def destroy
        @reservation = Reservation.find(params[:id])

        if @reservation.user != current_user
            render json: { error: "You can't delete someone else's reservation." }, status: :forbidden
            return
        end

        @reservation.destroy
        render json: { message: 'Reservation deleted successfully' }
    end
  
    private
  
    def reservation_params
        params.require(:reservation).permit(:restaurant_id, :date, :time, :party_size, :occasion)
    end
  
    def require_login
        unless current_user
            render json: { error: 'You must be logged in to access this section' }, status: :unauthorized
        end
    end
end