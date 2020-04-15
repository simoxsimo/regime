require 'test_helper'

class NutrimentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nutriments_new_url
    assert_response :success
  end

  test "should get create" do
    get nutriments_create_url
    assert_response :success
  end

  test "should get index" do
    get nutriments_index_url
    assert_response :success
  end

end
