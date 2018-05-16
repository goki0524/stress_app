require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  
  def setup
    @company = companies(:company_1)
  end
  
  #会社アカウントが実施回を作る一連の動作
  test "project interface" do
    #ログインしていない状態でPOSTで送る
    assert_no_difference '@company.projects.count' do
    post projects_path, params: { project: { project_name: "project_name_test", 
          employee_number: 5, start_date: "2018-04-24", end_date: "2018-05-24" } }
    end
    assert_redirected_to login_url
    #ログインした状態で無効な値を送る
    log_in_as_company(@company)
    assert_no_difference '@company.projects.count' do
    post projects_path, params: { project: { project_name: " ", 
          employee_number: 0, start_date: "2018-04-24", end_date: "2018-04-01" } }
    end
    assert_template :new
    assert_select 'div#error_explanation'
    #ログインして有効な値を送信
    assert_difference '@company.projects.count', 1 do
      post projects_path, params: { project: { project_name: "project_name_test", 
          employee_number: 5, start_date: "2018-04-24", end_date: "2018-05-24" } }
    end
    assert_not flash.empty?
    assert_redirected_to @company
    #showページに移動し登録した情報が表示できているか
    project = @company.projects.find_by(project_name: "project_name_test")
    get project_path(project)
    assert_match "project_name_test", response.body
  end
  
end
