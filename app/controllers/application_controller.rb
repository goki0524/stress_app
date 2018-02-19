class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # beforeアクション

  # ログイン済みかどうか確認
  def logged_in_company
    unless logged_in_company?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  # ログイン済みかどうか確認
  def logged_in_employee
    unless logged_in_employee?
      flash[:danger] = "Please log in."
      redirect_to login_employee_url
    end
  end
  
end
