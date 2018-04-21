class ApplicationMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default from: "noreply@example.com"
  layout 'mailer'
end
