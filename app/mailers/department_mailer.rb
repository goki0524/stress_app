class DepartmentMailer < ApplicationMailer

  def send_qrcode(department)
    @department = department
    @department_url = url_for([@department, only_path: false])
    @company = @department.company
    @company_url = url_for([@company, only_path: false])
    mail to: @company.company_email, subject: "QRcode" 
  end
end
