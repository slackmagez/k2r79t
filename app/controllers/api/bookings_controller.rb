class Api::BookingsController < ApplicationController
  def index
    bookings = Booking.where(user_id: params[:user_id])
    render json: bookings, include: [:user]
  end
end
