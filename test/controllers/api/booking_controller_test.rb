require 'test_helper'

class BookingControllerTest < ActionDispatch::IntegrationTest

  setup do
    @john_doe = users(:john_doe)
  end

  test "should get index" do
    get api_user_bookings_url(@john_doe), xhr: true
    bookings = JSON.parse(@response.body)
    assert bookings.length == 2, "There are #{bookings.length} bookings instead of 2"
    assert bookings.all? { |booking| booking["user"]["id"] == @john_doe.id }, "Returned bookings aren't all owned by #{@john_doe.firstname} #{@john_doe.lastname}"
  end

end
