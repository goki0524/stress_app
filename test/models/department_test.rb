require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  
  def setup
    @company = companies(:company_1)
    @department = @company.departments.build(department_name: "sales", 
                  employee_number: 5)
  end
  
  test "should be valid" do
    assert @department.valid?
  end
  
  test "company id should be present" do
    @department.company_id = nil
    assert_not @department.valid?
  end
  
  test "department name should be present" do
    @department.department_name = " "
    assert_not @department.valid?
  end
  
  test "department name should not be too long" do
    @department.department_name = "a" * 51
    assert_not @department.valid?
  end
  
  test "employee number should be present" do
    @department.employee_number = nil
    assert_not @department.valid?
  end
  
  test "employee number should be integer and real number" do
    @department.employee_number = 1.1
    assert_not @department.valid?
    @department.employee_number = 0
    assert_not @department.valid?
    @department.employee_number = -1
    assert_not @department.valid?
  end
  
end
