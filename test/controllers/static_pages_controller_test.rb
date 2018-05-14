require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Stress App"
    @help_title = "マニュアル"
    @about_title = "ストレスチェックとは"
    @contact_title = "お問い合わせ"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
  
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "#{@help_title} | #{@base_title}"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@about_title} | #{@base_title}"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "#{@contact_title} | #{@base_title}"
  end
  
end
