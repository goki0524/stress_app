class CompanyMailer < ApplicationMailer

  def account_activation(company)
    @company = company
    mail to: @company.company_email, subject: "Stress App アカウントを有効にしてください"
  end
  
  def send_payment(company, project)
    @company = company
    @project = project
    @values = @project.values
    @price = @project.employee_number * 100
    @high_stress_count = 0
    @interview_count = 0
    @values.each do |value|
      @high_stress_count += 1 if value.high_value? 
      @interview_count += 1 if value.interview
    end
    
    mail to: @company.company_email, subject: "実施回「#{@project.project_name}」終了の通知"
  end
  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
end
