require 'test_helper'

class DmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dms_index_url
    assert_response :success
  end

  test "should get create" do
    get dms_create_url
    assert_response :success
  end

  test "should get new" do
    get dms_new_url
    assert_response :success
  end

  test "should get destroy" do
    get dms_destroy_url
    assert_response :success
  end

end
