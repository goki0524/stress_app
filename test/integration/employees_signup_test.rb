require 'test_helper'

class EmployeesSignupTest < ActionDispatch::IntegrationTest
  test "invalid employee signup information" do
    get new_employee_path
    assert_no_difference 'Employee.count' do
      post employees_path, params: { employee: { 
        first_name: " ", last_name: " ", email: "employee@email",
        age: 0, sex: 0, password: "foo",  password_confirmation: "bar"
      } }
    end
    assert_template 'employees/new'
  end
  
  
  test "valid employee signup information" do
    assert_difference 'Employee.count', 1 do
      post employees_path, params: { employee: { 
        first_name: "test", last_name: "employee", email: "employee@email.com",
        age: 20, sex: 1, password: "foobar",  password_confirmation: "foobar"
      } }
    end
    follow_redirect!
    assert_template 'employees/show'
    assert is_employee_logged_in?
  end
  
  
end
