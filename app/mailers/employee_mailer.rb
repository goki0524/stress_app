class EmployeeMailer < ApplicationMailer
  
  def send_interview_mail(employee, companies)
    @employee = employee
    
    company_emails = companies.map{ |c| c.company_email }
    
    for company_email in company_emails
      #TODO: メソッドの引数にブロック変数は使えない
      mail to: company_email, subject: "高ストレス者からの面談希望" 
    end
  end
  
  
end
