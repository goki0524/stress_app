class DepartmentsController < ApplicationController
  before_action :logged_in_company, only:[:new, :create]
  
  def new
    @department = current_company.departments.build
  end
  
  def create
    @department = current_company.departments.build(department_params)
    if @department.save
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
