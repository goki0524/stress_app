class StaticPagesController < ApplicationController
  
  before_action :logged_in_company_or_employee, only:[:home]
  
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  
  private
  
  def logged_in_company_or_employee
    if logged_in_company? 
      redirect_to current_company
    elsif logged_in_employee?
      redirect_to current_employee
    end
  end
  
end

