class CompaniesController < ApplicationController
  before_action :logged_in_company, only:[:show]
  
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
      log_in(@company)
      flash[:success] = "Welcome to the Stress App!"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  
  
  private
  
    def company_params
     params.require(:company).permit(:company_name, :company_email,
             :all_employee_number, :password, :password_confirmation )
    end
    

end
