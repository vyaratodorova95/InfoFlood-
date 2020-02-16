require "application_system_test_case"

class LocationTest < ApplicationSystemTestCase
  setup do
    @location = location(:one)
  end

  test "visiting the index" do
    visit location_url
    assert_selector "h1", text: "Location"
  end

  test "creating a Location" do
    visit location_url
    click_on "New Location"

    fill_in "Area", with: @location.area
    fill_in "Country", with: @location.country_id
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit location_url
    click_on "Edit", match: :first

    fill_in "Area", with: @location.area
    fill_in "Country", with: @location.country_id
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit location_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
