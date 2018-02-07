require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
 
 def setup
   @company = Company.new(company_name: "Example Company", 
              company_email: "info@example.com", department_number: 10,
               employee_number: 50, password: "foobar", 
               password_confirmation: "foobar")
 end
 
  test "should be valid" do
    assert @company.valid?
  end
  
  test "company name should be present" do
    @company.company_name = "     "
    assert_not @company.valid?
  end
  
  test "company email should be present" do
    @company.company_email = "     "
    assert_not @company.valid?
  end
  
  test "department number should be present" do
    @company.department_number = "     "
    assert_not @company.valid?
  end
  
  test "department number should be integer" do
    @company.department_number = 1.1
    assert_not @company.valid?
  end
  
  test "department number should be natural number" do
    @company.department_number = 0
    assert_not @company.valid?
  end
  
  test "employee number should be present" do
    @company.employee_number = "     "
    assert_not @company.valid?
  end
  
  test "employee number should be integer" do
    @company.employee_number = 1.1
    assert_not @company.valid?
  end
  
  test "employee number should be natural number" do
    @company.employee_number = 0
    assert_not @company.valid?
  end
  
  test "company name should not be too long" do
    @company.company_name = "a" * 51
    assert_not @company.valid?
  end
  
  test "company email should not be too long" do
    @company.company_email = "a" * 244 + "@example.com"
    assert_not @company.valid?
  end
  
  test "company email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @company.company_email = valid_address
      assert @company.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
   test "company email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @company.company_email = invalid_address
      assert_not @company.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "company email addresses should be unique" do
    duplicate_company = @company.dup
    duplicate_company.company_email = @company.company_email.upcase
    @company.save
    assert_not duplicate_company.valid?
  end
  
  test "company email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @company.company_email = mixed_case_email
    @company.save
    assert_equal mixed_case_email.downcase, @company.reload.company_email
  end
  
  test "password should be present (nonblank)" do
    @company.password = @company.password_confirmation = " " * 6
    assert_not @company.valid?
  end
  
   test "password should have a minimum length" do
    @company.password = @company.password_confirmation = "a" * 5
    assert_not @company.valid?
  end
 
end
