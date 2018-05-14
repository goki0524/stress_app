require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get login_path
    assert_response :success
  end
  
  test "should get new_employee" do
    get new_employee_path
    assert_response :success
  end

end
