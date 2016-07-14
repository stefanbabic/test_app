require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "test",
                                         password_confirmation: "example" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Test User",
                                         email: "user@mail.com",
                                         password:              "test111",
                                         password_confirmation: "test111" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end
end
