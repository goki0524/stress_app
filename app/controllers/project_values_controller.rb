class ProjectValuesController < ApplicationController
  
  def create
    project = Project.find(params[:project_id])
    value = Value.find(params[:value_id])
    value.belong(project)
    flash[:success] = "実施回「#{project.project_name}」に提出しました。"
    redirect_to value_path(value)
    if project.employee_number <= project.values.count
      project.company.send_payment_email(project)
    end
  end
  
  def destroy
    project = ProjectValue.find(params[:id]).project
    value = ProjectValue.find(params[:id]).value
    value.escape(project)
    flash[:danger] = "提出を取り下げました。"
    redirect_to value_path(value)
  end
  
end
