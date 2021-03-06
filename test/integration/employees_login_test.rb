require 'test_helper'

class EmployeesLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @employee = employees(:employee_1)
    @other_employee = employees(:employee_2)
  end
  
  test "login with invalid information" do
    get login_employee_path
    assert_template 'sessions/new_employee'
    post login_employee_path, params: { session: { email: " ", password: " " } }
    assert_template 'sessions/new_employee'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_employee_path
    post login_employee_path, params: { session: { email: @employee.email, 
                                      password: "password" } }
    assert is_employee_logged_in?
    assert_redirected_to @employee
    follow_redirect!
    assert_template 'employees/show'
    assert_select "a[href=?]", login_employee_path, count: 0
    assert_select "a[href=?]", logout_employee_path
    assert_select "a[href=?]", employee_path(@employee)
    delete logout_employee_path
    assert_not is_employee_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_employee_path
    assert_select "a[href=?]", logout_employee_path, count: 0
    assert_select "a[href=?]", employee_path(@employee), count: 0
  end
  
  test "login with valid information followed by current employee" do
    get login_employee_path
    post login_employee_path, params: { session: { email: @employee.email, 
                                      password: "password" } }
    assert is_employee_logged_in?
    assert_redirected_to @employee
    follow_redirect!
    get employee_path(@other_employee)
    assert_redirected_to root_url
  end
end
