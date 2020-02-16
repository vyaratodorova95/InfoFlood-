require "application_system_test_case"

class InformationTest < ApplicationSystemTestCase
  setup do
    @information = information(:one)
  end

  test "visiting the index" do
    visit information_url
    assert_selector "h1", text: "Information"
  end

  test "creating a Information" do
    visit information_url
    click_on "New Information"

    fill_in "Began", with: @information.began
    fill_in "Country", with: @information.country_id
    fill_in "Dead", with: @information.dead
    fill_in "Displaced", with: @information.displaced
    fill_in "Ended", with: @information.ended
    fill_in "Maincause", with: @information.maincause
    fill_in "Validation", with: @information.validation
    click_on "Create Information"

    assert_text "Information was successfully created"
    click_on "Back"
  end

  test "updating a Information" do
    visit information_url
    click_on "Edit", match: :first

    fill_in "Began", with: @information.began
    fill_in "Country", with: @information.country_id
    fill_in "Dead", with: @information.dead
    fill_in "Displaced", with: @information.displaced
    fill_in "Ended", with: @information.ended
    fill_in "Maincause", with: @information.maincause
    fill_in "Validation", with: @information.validation
    click_on "Update Information"

    assert_text "Information was successfully updated"
    click_on "Back"
  end

  test "destroying a Information" do
    visit information_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Information was successfully destroyed"
  end
end
