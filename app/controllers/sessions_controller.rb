class SessionsController < ApplicationController
  before_action :logged_in_not_loginpage, only:[:new, :new_employee]
  
  def new
  end
  
  def new_employee
  end
  
  def create
    company = Company.find_by(company_email: params[:session][:company_email].downcase)
    if company && company.authenticate(params[:session][:password])
      if company.activated?
        #２重でログインさせないため
        log_out_employee if logged_in_employee?
        log_in_company(company)
        redirect_to company
      else
        message  = "アカウントが有効ではありません。"
        message += "Emailを確認しアカウントを有効にしてください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Emailまたはパスワードが間違えています。' 
      render 'new'
    end
  end
  
  def create_employee
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      #２重でログインさせないため
      log_out_company if logged_in_company?
      log_in_employee(employee)
      redirect_to employee
    else
      flash.now[:danger] = 'Emailまたはパスワードが間違えています。'
      render 'new_employee'
    end
  end
  
  def destroy
    log_out_company
    redirect_to root_url
  end
  
  def destroy_employee
    log_out_employee
    redirect_to root_url
  end
  
  private
  
    def logged_in_not_loginpage
      if logged_in_company? || logged_in_employee?
        redirect_to root_url
      end
    end
end
