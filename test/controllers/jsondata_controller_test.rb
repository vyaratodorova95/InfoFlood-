require 'test_helper'

class JsondataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jsondata_index_url
    assert_response :success
  end

end
