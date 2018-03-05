# Preview all emails at http://localhost:3000/rails/mailers/company_mailer
class CompanyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/company_mailer/account_activation
  def account_activation
    company = Company.first
    company.activation_token = Company.new_token
    CompanyMailer.account_activation(company)
  end

  # Preview this email at http://localhost:3000/rails/mailers/company_mailer/password_reset
  def password_reset
    CompanyMailer.password_reset
  end

end
