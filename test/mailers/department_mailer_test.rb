require 'test_helper'

class DepartmentMailerTest < ActionMailer::TestCase
  test "send_qrcode" do
    mail = DepartmentMailer.send_qrcode
    assert_equal "Send qrcode", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
