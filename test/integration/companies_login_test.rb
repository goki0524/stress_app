require 'test_helper'

class CompaniesLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @company = companies(:test_1)
    @other_company = companies(:test_2)
  end
 
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { company_email: " " , password: " " } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { company_email: @company.company_email,
                              password: "password" } }
    assert is_company_logged_in?
    assert_redirected_to @company
    follow_redirect!
    assert_template 'companies/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", company_path(@company)
    delete logout_path
    assert_not is_company_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", company_path(@company), count: 0
  end
  
  test "login with valid information followed by current company" do
    get login_path
    post login_path, params: { session: { company_email: @company.company_email,
                              password: "password" } }
    assert is_company_logged_in?
    assert_redirected_to @company
    follow_redirect!
    get company_path(@other_company)
    assert_redirected_to root_url
  end
  
  
end
