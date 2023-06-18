require "test_helper"

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservation_new_url
    assert_response :success
  end
end
