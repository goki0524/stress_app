class CompaniesController < ApplicationController
  before_action :logged_in_company, only:[:show]
  before_action :correct_company, only:[:show]
  
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
      @company.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  
  
  private
  
    def company_params
     params.require(:company).permit(:company_name, :company_email,
             :all_employee_number, :password, :password_confirmation )
    end
    
    def correct_company
      @company = Company.find(params[:id])
      redirect_to(root_url) unless current_company?(@company)
    end
    
end
