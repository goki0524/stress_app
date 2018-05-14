require 'test_helper'

class ValuesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @value = values(:value_1)
  end
  
  #ログインしていない状態でのテスト
  test "should redirect new when logged in" do
    get new_value_path
    assert_not flash.empty?
    assert_redirected_to login_employee_url
  end
  
  test "should redirect show when logged in" do
    get value_path(@value)
    assert_not flash.empty?
    assert_redirected_to login_employee_url
  end
  
end
