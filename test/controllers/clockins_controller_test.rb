require 'test_helper'

class ClockinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clockin = clockins(:one)
  end

  test "should get index" do
    get clockins_url
    assert_response :success
  end

  test "should get new" do
    get new_clockin_url
    assert_response :success
  end

  test "should create clockin" do
    assert_difference('Clockin.count') do
      post clockins_url, params: { clockin: { location: @clockin.location, user_id: @clockin.user_id } }
    end

    assert_redirected_to clockin_url(Clockin.last)
  end

  test "should show clockin" do
    get clockin_url(@clockin)
    assert_response :success
  end

  test "should get edit" do
    get edit_clockin_url(@clockin)
    assert_response :success
  end

  test "should update clockin" do
    patch clockin_url(@clockin), params: { clockin: { location: @clockin.location, user_id: @clockin.user_id } }
    assert_redirected_to clockin_url(@clockin)
  end

  test "should destroy clockin" do
    assert_difference('Clockin.count', -1) do
      delete clockin_url(@clockin)
    end

    assert_redirected_to clockins_url
  end
end
