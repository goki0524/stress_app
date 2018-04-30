require 'test_helper'

class ProjectValuesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get project_values_create_url
    assert_response :success
  end

  test "should get destroy" do
    get project_values_destroy_url
    assert_response :success
  end

end
