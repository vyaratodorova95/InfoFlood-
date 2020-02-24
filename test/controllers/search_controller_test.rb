require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search = search(:one)
  end

  test "should get index" do
    get search_index_url
    assert_response :success
  end

  test "should get new" do
    get new_search_url
    assert_response :success
  end

  test "should create search" do
    assert_difference('Search.count') do
      post search_index_url, params: { search: { area: @search.area, began: @search.began, country_id: @search.country_id, dead: @search.dead, displaced: @search.displaced, ended: @search.ended, lat: @search.lat, long: @search.long, maincause: @search.maincause } }
    end

    assert_redirected_to search_url(Search.last)
  end

  test "should show search" do
    get search_url(@search)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_url(@search)
    assert_response :success
  end

  test "should update search" do
    patch search_url(@search), params: { search: { area: @search.area, began: @search.began, country_id: @search.country_id, dead: @search.dead, displaced: @search.displaced, ended: @search.ended, lat: @search.lat, long: @search.long, maincause: @search.maincause } }
    assert_redirected_to search_url(@search)
  end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete search_url(@search)
    end

    assert_redirected_to search_index_url
  end
end
