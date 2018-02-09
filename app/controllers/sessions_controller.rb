class SessionsController < ApplicationController
  def new
  end
  
  def create
    company = Company.find_by(company_email: params[:session][:company_email].downcase)
    if company && company.authenticate(params[:session][:password])
      log_in(company)
      redirect_to company
    else
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
