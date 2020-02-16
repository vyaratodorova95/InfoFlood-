require 'test_helper'

class InfoFloodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get info_flood_index_url
    assert_response :success
  end

end
