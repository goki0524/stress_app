class RelationshipsController < ApplicationController
  
  def create
    department = Department.find(params[:department_id])
    current_employee.belong(department)
    redirect_to department_path(department)
  end
  
  def destroy
    department = Relationship.find(params[:id]).department
    current_employee.escape(department)
    redirect_to department_path(department)
  end
end
