class Api::BookingsController < ApplicationController
    def index
        bookings = Booking.all
        render json: bookings
    end
end
