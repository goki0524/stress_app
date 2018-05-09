class EmployeeMailer < ApplicationMailer
  
  def send_interview_mail(employee, companies)
    @employee = employee
    companies.each do |c|
      mail to: c.company_email, subject: "高ストレス者からの面談希望" 
    end
  end
  
  
end
