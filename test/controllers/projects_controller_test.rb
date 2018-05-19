require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @project = projects(:project_1)
  end
  
  #ログインしていない状態のテスト
  test "should redirect new when not logged in" do
    get new_project_path
    assert_not flash.empty?
    assert_redirected_to login_company_url
  end
  
  test "should redirect show when not logged in" do
    get project_path(@project)
    assert_not flash.empty?
    assert_redirected_to login_company_url
  end
  
end
