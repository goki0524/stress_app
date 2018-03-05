require 'test_helper'

class CompaniesSignupTest < ActionDispatch::IntegrationTest
  # test "invalid company signup information" do
  #   get new_company_path
  #   assert_no_difference 'Company.count' do
  #     post companies_path, params: { company: { 
  #             company_name: " ", company_email: "company@email", 
  #             all_employee_number: 0,
  #             password: "foo",   password_confirmation: "bar" } }
  #   end
  #   assert_template 'companies/new'
  # end
  
  # test "valid company signup information" do
  #   assert_difference 'Company.count', 1 do
  #     post companies_path, params: { company: { 
  #             company_name: "company", company_email: "company@email.com", 
  #             all_employee_number: 1,
  #             password: "password",   password_confirmation: "password" } }
  #   end
  #   follow_redirect!
  #   assert_template 'companies/show'
  #   assert is_company_logged_in?
  # end
  
  
end
