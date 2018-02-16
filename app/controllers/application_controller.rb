class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # beforeアクション

  # ログイン済みかどうか確認
  def logged_in_company
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
