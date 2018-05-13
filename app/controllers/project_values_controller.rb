class ProjectValuesController < ApplicationController
  
  def create
    project = Project.find(params[:project_id])
    value = Value.find(params[:value_id])
    value.belong(project)
    redirect_to value_path(value)
    if project.employee_number <= project.values.count
      project.company.send_payment_email(project)
    end
  end
  
  def destroy
    project = ProjectValue.find(params[:id]).project
    value = Value.find(params[:value_id])
    value.escape(project)
    redirect_to value_path(value)
  end
  
end
