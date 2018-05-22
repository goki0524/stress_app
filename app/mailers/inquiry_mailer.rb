class InquiryMailer < ActionMailer::Base
  
  default from: "goki0524@gmail.com"
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail to: "goki0524@gmail.com", subject: "Stress Appよりお問い合わせの通知"
  end
 
end