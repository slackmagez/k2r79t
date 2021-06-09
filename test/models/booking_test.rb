require 'test_helper'

class BookingTest < ActiveSupport::TestCase
    test "should not save without start / end dates and user" do
        booking = Booking.new
        assert_not booking.save

        booking.user = User.find(1)
        assert_not booking.save

        booking.start_date = Time.local(2017, 1, 1, 12, 0, 0).to_date
        assert_not booking.save

        booking.end_date = Time.local(2017, 1, 2, 16, 30, 0).to_date
        assert booking.save
    end
end
