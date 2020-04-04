require 'test_helper'

class AgreementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agreements_index_url
    assert_response :success
  end

  test "should get show" do
    get agreements_show_url
    assert_response :success
  end

  test "should get new" do
    get agreements_new_url
    assert_response :success
  end

  test "should get edit" do
    get agreements_edit_url
    assert_response :success
  end

end
