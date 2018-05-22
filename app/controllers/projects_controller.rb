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
      flash[:success] = "実施回を作成しました。"
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
    @interview_count = 0
    
    @values.each do |value|
      @high_stress_count += 1 if value.high_value? 
      @interview_count += 1 if value.interview
    end
    
    chart_finish_value = (@values.count.to_f / @project.employee_number.to_f) * 100.0
    chart_unfinish_value = 100.0 - chart_finish_value
    @chart_finish_stress = LazyHighCharts::HighChart.new("graph") do |c|
      c.chart(type: "pie")
      c.title(text: "受検終了者割合(%)")
      c.plotOptions(pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'}
            })
        
      c.series(name: "Brands",
               colorByPoint: true,
               data: [{
                    name: "受検終了者",
                    y: chart_finish_value
               }, {
                   name: "未受検者" ,
                    y: chart_unfinish_value
               }])
    end
    
    #高ストレス者の割合
    chart_high_value = (@high_stress_count.to_f / @values.count.to_f) * 100.0
    #非高ストレスの割合
    chart_low_value = 100.0 - chart_high_value
    @chart_high_stress = LazyHighCharts::HighChart.new("graph") do |c|
      c.chart(type: "pie")
      c.title(text: "高ストレス者割合(%)")
      c.plotOptions(pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'}
            })
      c.series(name: "Brands",
               colorByPoint: true,
               data: [{
                    name: "高ストレス者",
                    y: chart_high_value
               }, {
                   name: "非高ストレス" ,
                    y: chart_low_value
               }])
    end
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
