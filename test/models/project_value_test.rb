require 'test_helper'

class ProjectValueTest < ActiveSupport::TestCase
  
  def setup
    @project_value = ProjectValue.new(project_id: projects(:project_1).id,
                        value_id: values(:value_1).id)
  end
  
  test "should be valid" do
    assert @project_value.valid?
  end
  
  test "should require a project id" do
    @project_value.project_id = nil
    assert_not @project_value.valid?
  end
  
  test "should require a value id" do
    @project_value.value_id = nil
    assert_not @project_value.valid?
  end
  
end
