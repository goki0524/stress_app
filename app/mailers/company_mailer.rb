class CompanyMailer < ApplicationMailer

  def account_activation(company)
    @company = company
    mail to: company.company_email, subject: "Stress App アカウントを有効にしてください"
  end
  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
end
