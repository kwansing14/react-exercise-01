require 'test_helper'

class ClockoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clockout = clockouts(:one)
  end

  test "should get index" do
    get clockouts_url
    assert_response :success
  end

  test "should get new" do
    get new_clockout_url
    assert_response :success
  end

  test "should create clockout" do
    assert_difference('Clockout.count') do
      post clockouts_url, params: { clockout: { location: @clockout.location, user_id: @clockout.user_id } }
    end

    assert_redirected_to clockout_url(Clockout.last)
  end

  test "should show clockout" do
    get clockout_url(@clockout)
    assert_response :success
  end

  test "should get edit" do
    get edit_clockout_url(@clockout)
    assert_response :success
  end

  test "should update clockout" do
    patch clockout_url(@clockout), params: { clockout: { location: @clockout.location, user_id: @clockout.user_id } }
    assert_redirected_to clockout_url(@clockout)
  end

  test "should destroy clockout" do
    assert_difference('Clockout.count', -1) do
      delete clockout_url(@clockout)
    end

    assert_redirected_to clockouts_url
  end
end
