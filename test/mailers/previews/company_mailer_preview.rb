# Preview all emails at http://localhost:3000/rails/mailers/company_mailer
class CompanyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/company_mailer/send_qrcode
  def send_qrcode
    CompanyMailer.send_qrcode
  end

end
