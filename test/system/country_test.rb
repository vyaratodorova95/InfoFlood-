require "application_system_test_case"

class CountryTest < ApplicationSystemTestCase
  setup do
    @country = country(:one)
  end

  test "visiting the index" do
    visit country_url
    assert_selector "h1", text: "Country"
  end

  test "creating a Country" do
    visit country_url
    click_on "New Country"

    fill_in "Name", with: @country.name
    click_on "Create Country"

    assert_text "Country was successfully created"
    click_on "Back"
  end

  test "updating a Country" do
    visit country_url
    click_on "Edit", match: :first

    fill_in "Name", with: @country.name
    click_on "Update Country"

    assert_text "Country was successfully updated"
    click_on "Back"
  end

  test "destroying a Country" do
    visit country_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country was successfully destroyed"
  end
end
