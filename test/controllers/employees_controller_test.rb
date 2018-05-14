require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @employee = employees(:employee_1)
  end
  
  test "should get new" do
    get new_employee_path
    assert_response :success
  end
  
  #ログインしていない状態でのテスト
  test "should redirect show when not logged in" do
    get employee_path(@employee)
    assert_not flash.empty?
    assert_redirected_to login_employee_url
  end
end
