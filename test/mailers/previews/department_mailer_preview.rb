# Preview all emails at http://localhost:3000/rails/mailers/department_mailer
class DepartmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/department_mailer/send_qrcode
  def send_qrcode
    department = Department.first
    DepartmentMailer.send_qrcode(department)
  end

end
