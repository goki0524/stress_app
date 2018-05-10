class EmployeeMailer < ApplicationMailer
  
  def send_interview_mail(employee, companies)
    @employee = employee
    company_emails = companies.map{ |c| c.company_email }
    for company_email in company_emails
      mail to: company_email, subject: "高ストレス者からの面談希望の通知" 
    end
  end
  
  def send_result_mail(employee, value)
    @employee = employee
    @value = value
    @value_url = url_for([@value, only_path: false])
    mail to: @employee.email, subject: "#{@employee.first_name + @employee.last_name}様のストレスチェック結果"
  end
  
  
end
