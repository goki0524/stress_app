class CompanyMailer < ApplicationMailer

  def account_activation(company)
    @company = company
    mail to: company.company_email, subject: "Account activation"
  end
  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
end
