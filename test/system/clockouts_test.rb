require "application_system_test_case"

class ClockoutsTest < ApplicationSystemTestCase
  setup do
    @clockout = clockouts(:one)
  end

  test "visiting the index" do
    visit clockouts_url
    assert_selector "h1", text: "Clockouts"
  end

  test "creating a Clockout" do
    visit clockouts_url
    click_on "New Clockout"

    fill_in "Location", with: @clockout.location
    fill_in "User", with: @clockout.user_id
    click_on "Create Clockout"

    assert_text "Clockout was successfully created"
    click_on "Back"
  end

  test "updating a Clockout" do
    visit clockouts_url
    click_on "Edit", match: :first

    fill_in "Location", with: @clockout.location
    fill_in "User", with: @clockout.user_id
    click_on "Update Clockout"

    assert_text "Clockout was successfully updated"
    click_on "Back"
  end

  test "destroying a Clockout" do
    visit clockouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clockout was successfully destroyed"
  end
end
