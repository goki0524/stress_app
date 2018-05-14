ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests
  # in alphabetical order.
  fixtures :all
  include ApplicationHelper
  # Add more helper methods to be used by all tests here...
  
  # テストcompanyがログイン中の場合にtrueを返す
  def is_company_logged_in?
    !session[:company_id].nil?
  end
  
  # テストemployeeがログイン中の場合にtrueを返す
  def is_employee_logged_in?
    !session[:employee_id].nil?
  end
  
  #テストcompanyとしてログインする
  def log_in_as_company(company)
    session[:company_id] = company.id
  end
  
  #テストemployeeとしてログインする
  def log_in_as_employee(employee)
    session[:employee_id] = employee.id
  end
  
end