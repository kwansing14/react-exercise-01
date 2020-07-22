require "application_system_test_case"

class ClockinsTest < ApplicationSystemTestCase
  setup do
    @clockin = clockins(:one)
  end

  test "visiting the index" do
    visit clockins_url
    assert_selector "h1", text: "Clockins"
  end

  test "creating a Clockin" do
    visit clockins_url
    click_on "New Clockin"

    fill_in "Location", with: @clockin.location
    fill_in "User", with: @clockin.user_id
    click_on "Create Clockin"

    assert_text "Clockin was successfully created"
    click_on "Back"
  end

  test "updating a Clockin" do
    visit clockins_url
    click_on "Edit", match: :first

    fill_in "Location", with: @clockin.location
    fill_in "User", with: @clockin.user_id
    click_on "Update Clockin"

    assert_text "Clockin was successfully updated"
    click_on "Back"
  end

  test "destroying a Clockin" do
    visit clockins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clockin was successfully destroyed"
  end
end
