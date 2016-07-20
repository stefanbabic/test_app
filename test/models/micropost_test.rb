require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:stefan)
    @micropost = @user.microposts.build(content: "Testing app")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "s" * 141
    assert_not @micropost.valid?
  end

  test "order should be last post first" do
    assert_equal microposts(:last_post), Micropost.first
  end
end
