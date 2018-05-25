# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
  
  # Preview this email at http://localhost:3000/rails/mailers/employee_mailer/send_interview_mail
  def send_interview_mail
    employee = Employee.find_by(email: "test@test.com")
    # companies = employee.departments.map{ |d| d.company }
    value = Value.find(33)
    company = []
    value.projects.each do |project|
      company << project.company
    end
    EmployeeMailer.send_interview_mail(employee, company)
  end
  
  # Preview this email at http://localhost:3000/rails/mailers/employee_mailer/send_result_mail
  def send_result_mail
    employee = Employee.find_by(email: "test@test.com")
    value = employee.values.last
    EmployeeMailer.send_result_mail(employee, value)
  end

end
