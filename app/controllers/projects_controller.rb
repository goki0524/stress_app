class ProjectsController < ApplicationController
  before_action :logged_in_company, only:[:new, :create, :show]
  before_action :correct_company, only:[:show]
  
  
  def new
    @company = current_company
    @project = @company.projects.build
  end
  
  def create
    @project = current_company.projects.build(project_params)
    if @project.save
      flash[:success] = "Project Created!"
      redirect_to company_path(current_company)
    else
      render 'new'
    end
  end
  
  def show
    @company = current_company
    @project = Project.find(params[:id])
    @values = @project.values
    @high_stress_count = 0
  end
  
  private
  
    def project_params
      params.require(:project).permit(:project_name, :employee_number, :start_date,
        :end_date, )
    end
    
    def correct_company
      redirect_to(root_url) unless 
      current_company == Project.find(params[:id]).company
    end
    
    
end
