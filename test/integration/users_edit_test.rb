require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:stefan)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "user@mail",
                                              password:              "test",
                                              password_confirmation: "user" } }

    assert_template 'users/edit'
  end
end
