class EmployeeMailer < ApplicationMailer
  
  #TODO: テスト必要.面談希望時のメイラーが正しく動作しているか
  #ストレス値を提出した実施回の会社と所属した部署の会社が同じかどうか
  def send_interview_mail(employee, companies)
    @employee = employee
    @belong_department = []
    #従業員が所属している部署を格納
    companies.each do |company|
      company.departments.each do |department|
        if department.belong?(@employee)
          @belong_department << department
        end
      end
    end
    company_emails = companies.map{ |company| company.company_email }
    for company_email in company_emails
      mail to: company_email, subject: "高ストレス者からの面談希望の通知" 
    end
  end
  
  def send_result_mail(employee, value)
    @employee = employee
    @value = value
    @value_url = url_for([@value, only_path: false])
    mail to: @employee.email, subject: "#{ @employee.full_name }様のストレスチェック結果"
  end
  
end
