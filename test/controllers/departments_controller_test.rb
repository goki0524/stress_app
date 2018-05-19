require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @department = departments(:department_1)
  end
  
  #ログインしていない状態のテスト
  test "should redirect new when not logged in" do
    get new_department_path
    assert_not flash.empty?
    assert_redirected_to login_company_url
  end
  
  test "should redirect show when not logged in" do
    get department_path(@department)
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
end
