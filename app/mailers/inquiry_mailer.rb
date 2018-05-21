class InquiryMailer < ActionMailer::Base
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail to: "goki0524@gmail.com", subject: "Stress Appよりお問い合わせの通知"
  end
 
end