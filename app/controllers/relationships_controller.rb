class RelationshipsController < ApplicationController
  
  def create
    department = Department.find(params[:department_id])
    current_employee.belong(department)
    flash[:success] = "#{department.department_name}に所属しました"
    redirect_to department_path(department)
    
  end
  
  def destroy
    department = Relationship.find(params[:id]).department
    current_employee.escape(department)
    flash[:danger] = "#{department.department_name}を脱退しました"
    redirect_to department_path(department)
  end
end
