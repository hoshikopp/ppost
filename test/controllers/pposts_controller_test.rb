require 'test_helper'

class PpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pposts_index_url
    assert_response :success
  end

  test "should get new" do
    get pposts_new_url
    assert_response :success
  end

  test "should get show" do
    get pposts_show_url
    assert_response :success
  end

end
