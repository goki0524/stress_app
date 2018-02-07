class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end
  
  def new
    @company = Company.new 
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Welcome to the Stress App!"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  
  
  private
  
    def company_params
     params.require(:company).permit(:company_name, :company_email,
             :department_number, :employee_number, :password, :password_confirmation )
    end
  
end
