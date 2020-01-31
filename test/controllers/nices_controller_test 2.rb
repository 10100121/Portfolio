require 'test_helper'

class NicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nices_index_url
    assert_response :success
  end

end
