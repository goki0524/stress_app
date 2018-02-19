require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  
  def setup
    @employee = Employee.new(first_name: "Sakaguchi", last_name: "Goki",
                email: "goki@test.com", age: 27, sex: 1, password: "foobar",
                password_confirmation: "foobar" )
  end
  
  test "should be valid" do
    assert @employee.valid?
  end
  
  test "first name should be present" do
    @employee.first_name = " "
    assert_not @employee.valid?
  end
  
  test "first name should not be too long" do
    @employee.first_name = "a" * 21
    assert_not @employee.valid?
  end
  
  test "last name should be present" do
    @employee.last_name = " "
    assert_not @employee.valid?
  end
  
  test "last name should not be too long" do
    @employee.last_name = "a" * 21
    assert_not @employee.valid?
  end
  
  test "age should be integer" do
    @employee.age = 1.1
    assert_not @employee.valid?
  end
  
  test "age should be natural number" do
    @employee.age = 0
    assert_not @employee.valid?
  end
  
  test "sex should be 1 or 2 number" do
    @employee.sex = 0
    assert_not @employee.valid?
    @employee.sex = 3
    assert_not @employee.valid?
    @employee.sex = 1.1
    assert_not @employee.valid?
  end
  
  test "email should be present" do
    @employee.email = " "
    assert_not @employee.valid?
  end
  
  test "email should not be too long" do
    @employee.email = "a" * 244 + "@example.com"
    assert_not @employee.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @employee.email = valid_address
      assert @employee.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @employee.email = invalid_address
      assert_not @employee.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_employee = @employee.dup
    duplicate_employee.email = @employee.email.upcase
    @employee.save
    assert_not duplicate_employee.valid?
  end
  
 test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @employee.email = mixed_case_email
    @employee.save
    assert_equal mixed_case_email.downcase, @employee.reload.email
  end
  
  test "password should be present (nonblank)" do
    @employee.password = @employee.password_confirmation = " " * 6
    assert_not @employee.valid?
  end

  test "password should have a minimum length" do
    @employee.password = @employee.password_confirmation = "a" * 5
    assert_not @employee.valid?
  end
end
