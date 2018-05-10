class AccountActivationsController < ApplicationController
  def edit
    company = Company.find_by(company_email: params[:email])
    if company && !company.activated? && company.authenticated?(:activation, params[:id])
      company.activate
      log_in_company(company)
      flash[:success] = "アカウントが有効になりました。"
      redirect_to company
    else
      flash[:danger] = "リンクの期限が切れています。"
      redirect_to root_url
    end
  end
end
