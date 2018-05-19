class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # beforeアクション

  # companyログイン済みかどうか確認
  def logged_in_company
    unless logged_in_company?
      flash[:danger] = "ログインしてください。"
      redirect_to login_company_url
    end
  end
  
  # employeeログイン済みかどうか確認
  def logged_in_employee
    unless logged_in_employee?
      flash[:danger] = "ログインしてください。"
      redirect_to login_employee_url
    end
  end
  
  # companyかemployeeがログイン済みかどうか確認
  def logged_in_company_or_employee
    unless logged_in_company? || logged_in_employee?
      flash[:danger] = "ログインしてください。"
      redirect_to root_url
    end
  end
  
end
