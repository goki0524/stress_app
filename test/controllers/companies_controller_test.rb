require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_company_path
    assert_response :success
  end

end
