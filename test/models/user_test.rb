require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(name: "Test", email: "user@mail.com",
                     password: "test1234", password_confirmation: "test1234")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "    "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "   "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "s" * 51
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "s" * 247 + "@mail.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@mail.com ajf_dsaas@mail.valid.com
  		FKR+FRE@test.org muenster.nrw@deutsch.DE]
  	valid_addresses.each do |valid_address|
  		@user.email = valid_address
  		assert @user.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@mail,com aksd_valid.org test.2@mail.
  		FFSA@mail_new.com adsd@new+mail.org hrhah@mail..com]
  	invalid_addresses.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end

  test "email address should be unique" do
  	duplicate = @user.dup
  	duplicate.email = @user.email.upcase
  	@user.save
  	assert_not duplicate.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Test@UsEr.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "s" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
