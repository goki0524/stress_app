require 'test_helper'

class DepartmentsTest < ActionDispatch::IntegrationTest
  def setup
    @company = companies(:company_1)
  end
  
  #会社アカウントが部署を作る一連の動作
  test "department interface" do
    #ログインしていない状態でPOSTで送る
    assert_no_difference '@company.departments.count' do
      post departments_path, params: { department: { department_name: "test", employee_number: 5 } }
    end
    assert_redirected_to login_url
    #ログインして無効な値の送信
    log_in_as_company(@company)
    assert_no_difference '@company.departments.count' do
      post departments_path, params: { department: { department_name: " ", employee_number: 0 } }
    end
    assert_template :new
    assert_select 'div#error_explanation'
    #ログインして有効な値の送信
    assert_difference '@company.departments.count', 1 do
      post departments_path, params: { department: { department_name: "department_name_test", employee_number: 5 } }
    end
    assert_not flash.empty?
    assert_redirected_to @company
    #showページに移動し登録した情報が表示できているか
    department = @company.departments.find_by(department_name: "department_name_test")
    get department_path(department)
    assert_match "department_name_test", response.body
  end
  
  
end
