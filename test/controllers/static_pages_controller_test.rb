require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Stress App"
    @help_title = "マニュアル"
    @about_title = "ストレスチェック制度について"
    @service_title = "StressAppについて"
    @privacy_title = "プライバシーポリシー"
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
  
  test "should get service" do
    get service_path
    assert_response :success
    assert_select "title", "#{@service_title} | #{@base_title}"
  end
  
  test "should get privacy" do
    get privacy_path
    assert_response :success
    assert_select "title", "#{@privacy_title} | #{@base_title}"
  end
  
end
