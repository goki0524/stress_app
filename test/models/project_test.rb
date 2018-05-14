require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @company = companies(:company_1)
    @project = @company.projects.build(project_name: "test",
          employee_number: 50, start_date: "2018-04-01", end_date: "2018-05-01")
  end
  
  test "should be valid" do
    assert @project.valid?
  end
  
  test "company id should be present" do
    @project.company_id = nil
    assert_not @project.valid?
  end
  
  test "project name should be present" do
    @project.project_name = " "
    assert_not @project.valid?
  end
  
  test "project name should not be too long" do
    @project.project_name = "a" * 51
    assert_not @project.valid?
  end
  
  test "employee number should be present" do
    @project.employee_number = nil
    assert_not @project.valid?
  end
  
  test "employee number should be integer and real number" do
    @project.employee_number = 1.1
    assert_not @project.valid?
    @project.employee_number = 0
    assert_not @project.valid?
    @project.employee_number = -1
    assert_not @project.valid?
  end
  
  test "start_end_check should be correct" do
    @project.start_date = Date.parse("2018-04-01")
    @project.end_date = Date.parse("2018-03-01")
    assert_not @project.valid?
  end
  
end
