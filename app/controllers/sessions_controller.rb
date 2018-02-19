class SessionsController < ApplicationController
  def new
  end
  
  def new_employee
  end
  
  def create
    company = Company.find_by(company_email: params[:session][:company_email].downcase)
    if company && company.authenticate(params[:session][:password])
      log_in_company(company)
      redirect_to company
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end
  
  def create_employee
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      log_in_employee(employee)
      redirect_to employee
    else
      flash.now[:danger] = 'Invalid email/password combination'
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
end
