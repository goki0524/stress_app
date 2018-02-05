require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Stress App"
    assert_equal full_title("Help"), "Help | Stress App"
  end
end