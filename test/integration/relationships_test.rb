require 'test_helper'

class RelationshipsTest < ActionDispatch::IntegrationTest
 
  def setup
    @department = departments(:department_1)
    @employee = employees(:employee_1)
    log_in_as_employee(@employee)
  end
  
  test "should create relationship department and employee" do
    assert_difference '@department.employees.count', 1 do
      post relationships_path, params: { department_id: @department.id }
    end
  end
  
  test "should delete relationship department and employee" do
    @employee.belong(@department)
    relationship = @employee.relationships.find_by(department_id: @department.id)
    assert_difference '@department.employees.count', -1 do
      delete relationship_path(relationship)
    end
  end
  
end
