require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @company = companies(:company_1)
    @other_company = companies(:company_2)
  end
  
  test "should get new" do
    get new_company_path
    assert_response :success
  end

  #ログインしていない状態でのテスト
  test "should redirect show when not logged in" do
    get company_path(@company)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  
  
end
