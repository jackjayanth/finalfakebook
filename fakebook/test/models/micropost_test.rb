require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
     @user = User.new(name: "Example User", email: "user@example.com",
                      password:"foobar", password_confirmation:"foobar")
    @micropost = Micropost.new(content: "Lorem ipsum jsjfbkjfbaksjfbsakj")
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
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
end
