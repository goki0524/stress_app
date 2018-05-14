require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  
  def setup
    @relationship = Relationship.new(department_id: departments(:department_1).id,
                      employee_id: employees(:employee_1).id)
  end
  
  test "should be valid" do
    assert @relationship.valid?
  end
  
  test "should require a department id" do
    @relationship.department_id = nil
    assert_not @relationship.valid?
  end
  
  test "should require a employee id" do
    @relationship.employee_id = nil
    assert_not @relationship.valid?
  end
  
end
