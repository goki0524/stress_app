# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
  def send_interview_mail
    employee = Employee.first
    companies = employee.departments.map{ |d| d.company }
    EmployeeMailer.send_interview_mail(employee, companies)
  end

end
