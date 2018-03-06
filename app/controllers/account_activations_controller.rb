class AccountActivationsController < ApplicationController
  def edit
    company = Company.find_by(company_email: params[:company_email])
   
    if company && !company.activated? && company.authenticated?(:activation, params[:id])
      company.activate
      log_in company
      flash[:success] = "Account activated!"
      redirect_to company
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
