require 'test_helper'

class ProjectValuesTest < ActionDispatch::IntegrationTest
  
  def setup
    @project = projects(:project_1)
    @value = values(:value_1)
  end
  
  test "should create relationship project and value" do
    assert_difference '@project.values.count', 1 do
      post project_values_path, params: { project_id: @project.id, 
                                          value_id: @value.id }
    end
  end
  
  test "should delete relationship project and value" do
    @value.belong(@project)
    relationship = @value.project_values.find_by(project_id: @project.id)
    assert_difference '@project.values.count', -1 do
      delete project_value_path(relationship)
    end
  end
  
end
