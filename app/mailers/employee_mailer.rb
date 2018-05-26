class EmployeeMailer < ApplicationMailer
  require "base64"
  #TODO: テスト必要.面談希望時のメイラーが正しく動作しているか
  #ストレス値を提出した実施回の会社と所属した部署の会社が同じかどうか
  def send_interview_mail(employee, companies)
    @employee = employee
    @companies = companies
    @company = nil
    for company in companies
      @company = company
      mail.body.decoded.to_s.force_encoding('utf-8')
      mail to: company.company_email, subject: "高ストレス者からの面談希望の通知" 
      @company = nil
    end
  end
  
  def send_result_mail(employee, value)
    @employee = employee
    @value = value
    @value_url = url_for([@value, only_path: false])
    mail to: @employee.email, subject: "#{ @employee.full_name }様のストレスチェック結果"
  end
  
end
