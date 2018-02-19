class EmployeesController < ApplicationController
  before_action :logged_in_employee, only:[:show]
  
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      log_in_employee(@employee)
      flash[:success] = "Welcome to the Stress App!"
      redirect_to @employee
    else
      render 'new'
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
  end


  private
  
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email,
      :age, :sex, :password, :password_confirmation )
    end

end
