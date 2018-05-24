require 'test_helper'

class ValuesTest < ActionDispatch::IntegrationTest
  
  def setup
    @employee = employees(:employee_1)
    @department = departments(:department_1)
    @project = projects(:project_1)
    @value = values(:value_1)
    @high_value = values(:value_2)
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
  end
  
  #ストレス結果をメールで送るを押すとメイラーが作動するか
  test "value send_email check" do
    log_in_as_employee(@employee)
    post send_email_value_path(@value)
    assert_not flash.empty?
    assert_redirected_to @value
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
  
  #高ストレス値の場合で面談希望時にメイラーが作動するか
  test "value interview check" do
    log_in_as_employee(@employee)
    @employee.belong(@department)
    @value.belong(@project)
    #高ストレス値でない場合のテスト: NG
    assert_not @value.high_value?
    post interview_value_path(@value)
    assert_equal 0, ActionMailer::Base.deliveries.size
    assert flash.empty?
    assert_redirected_to @value
    #高ストレス値の場合のテスト
    assert @high_value.high_value?
    #部署と関連付けをしていない場合: NG
    post interview_value_path(@high_value)
    assert_equal 0, ActionMailer::Base.deliveries.size
    #部署と関連付けをした場合: OK
    @high_value.belong(@project)
    post interview_value_path(@high_value)
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to @high_value
  end
  
  #面談確認ページリンクと面談希望のボタンのテスト
  test "interview_confirm link and interview_btn check" do
    log_in_as_employee(@employee)
    @value.belong(@project)
    #高ストレス値でない場合
    #面談確認ページリンク
    assert_not @value.high_value?
    get value_path(@value)
    assert_select 'a[href=?]', interview_confirm_value_path(@value), 
                    text: "面談確認画面へ", count: 0
    #面談希望のボタン
    get interview_confirm_value_path(@value)
    assert_select 'body div.interview-btn', false
    assert_select 'body div.un-interview-btn', false
    #高ストレス値の場合
    #面談確認ページリンク
    @high_value.belong(@project)
    assert @high_value.high_value?
    get value_path(@high_value)
    assert_select 'a[href=?]', interview_confirm_value_path(@high_value), 
                    text: "面談確認画面へ", count: 1
    #面談希望のボタン
    get interview_confirm_value_path(@high_value)
    assert_select 'body .interview-btn'
    assert_select 'body .un-interview-btn'
  end
  
  #TODO: 実施回との関連付けボタンのテスト
  #実施期間中の実施回で期間中に作成されたストレス値であるか、
  #またストレス値が他のストレス値と被って実施回に登録されていないか(super_belongの検証)
  # test "project_values btn check" do
  # end
    
  
end
