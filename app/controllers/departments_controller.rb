class DepartmentsController < ApplicationController
  before_action :logged_in_company, only:[:new, :create]
  before_action :logged_in_company_or_employee, only:[:show]
  
  def new
    @department = current_company.departments.build
  end
  
  def create
    @department = current_company.departments.build(department_params)
    if @department.save
      @department.send_qrcode_email
      flash[:success] = "Department created!"
      redirect_to current_company
    else
      render 'new'
    end
  end
  
  def show
    @department = Department.find(params[:id])
  end
  
  
  private 
  
    def department_params
      params.require(:department).permit(:department_name, :employee_number)
    end
    
end
