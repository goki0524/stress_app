require 'test_helper'

class ValuesTest < ActionDispatch::IntegrationTest
  
  def setup
    @employee = employees(:employee_2)
    @value_params = { value: {
      a1: 1, a2: 1, a3: 1, a4: 1, a5: 1, a6: 1, a7: 1, a8: 1, a9: 1, a10: 1,
      a11: 1, a12: 1, a13: 1, a14: 1, a15: 1, a16: 1, a17: 1, b1: 1, b2: 1, 
      b3: 1, b4: 1, b5: 1, b6: 1, b7: 1, b8: 1, b9: 1, b10: 1, b11: 1, b12: 1, 
      b13: 1, b14: 1, b15: 1, b16: 1, b17: 1, b18: 1, b19: 1, b20: 1, b21: 1, 
      b22: 1, b23: 1, b24: 1, b25: 1, b26: 1, b27: 1, b28: 1, b29: 1, c1: 1, 
      c2: 1, c3: 1, c4: 1, c5: 1, c6: 1, c7: 1, c8: 1, c9: 1, d1: 1, d2: 1
    } }
    @invalid_value_params = { value: {
      a1: 0, a2: 1, a3: 1, a4: 1, a5: 1, a6: 1, a7: 1, a8: 1, a9: 1, a10: 1,
      a11: 1, a12: 1, a13: 1, a14: 1, a15: 1, a16: 1, a17: 1, b1: 1, b2: 1, 
      b3: 1, b4: 1, b5: 1, b6: 1, b7: 1, b8: 1, b9: 1, b10: 1, b11: 1, b12: 1, 
      b13: 1, b14: 1, b15: 1, b16: 1, b17: 1, b18: 1, b19: 1, b20: 1, b21: 1, 
      b22: 1, b23: 1, b24: 1, b25: 1, b26: 1, b27: 1, b28: 1, b29: 1, c1: 1, 
      c2: 1, c3: 1, c4: 1, c5: 1, c6: 1, c7: 1, c8: 1, c9: 1, d1: 1, d2: 1
    } }
  end
  
  #従業員がストレス値を登録する一連の動作
  test "value interface" do
    #ログインしていない状態でPOSTで送る
    assert_no_difference '@employee.values.count' do
      post values_path, params: @value_params
    end
    assert_redirected_to login_employee_path
    #ログインした状態で無効な値を送る
    log_in_as_employee(@employee)
    assert_no_difference '@employee.values.count' do
      post values_path, params: @invalid_value_params
    end
    assert_template 'new'
    assert_select 'div#error_explanation'
    #ログインした状態で有効な値を送る
    assert_difference '@employee.values.count', 1 do
      post values_path, params: @value_params
    end
    assert_not flash.empty?
    assert_redirected_to @employee.values.last
  end
  
  
end
