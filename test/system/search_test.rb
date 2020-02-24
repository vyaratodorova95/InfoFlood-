require "application_system_test_case"

class SearchTest < ApplicationSystemTestCase
  setup do
    @search = search(:one)
  end

  test "visiting the index" do
    visit search_url
    assert_selector "h1", text: "Search"
  end

  test "creating a Search" do
    visit search_url
    click_on "New Search"

    fill_in "Area", with: @search.area
    fill_in "Began", with: @search.began
    fill_in "Country", with: @search.country_id
    fill_in "Dead", with: @search.dead
    fill_in "Displaced", with: @search.displaced
    fill_in "Ended", with: @search.ended
    fill_in "Lat", with: @search.lat
    fill_in "Long", with: @search.long
    fill_in "Maincause", with: @search.maincause
    click_on "Create Search"

    assert_text "Search was successfully created"
    click_on "Back"
  end

  test "updating a Search" do
    visit search_url
    click_on "Edit", match: :first

    fill_in "Area", with: @search.area
    fill_in "Began", with: @search.began
    fill_in "Country", with: @search.country_id
    fill_in "Dead", with: @search.dead
    fill_in "Displaced", with: @search.displaced
    fill_in "Ended", with: @search.ended
    fill_in "Lat", with: @search.lat
    fill_in "Long", with: @search.long
    fill_in "Maincause", with: @search.maincause
    click_on "Update Search"

    assert_text "Search was successfully updated"
    click_on "Back"
  end

  test "destroying a Search" do
    visit search_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search was successfully destroyed"
  end
end
