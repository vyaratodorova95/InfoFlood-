require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = location(:one)
  end

  test "should get index" do
    get location_index_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post location_index_url, params: { location: { area: @location.area, country_id: @location.country_id, lat: @location.lat, long: @location.long } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { area: @location.area, country_id: @location.country_id, lat: @location.lat, long: @location.long } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to location_index_url
  end
end
