require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "should create a new user" do
    user = User.new
    user.first_name = "Juan"
    user.last_name = 'Cruz'
    user.username = "juancruz"
    user.password = "password"
    user.password_confirmation = "password"

    assert user.save, "Could not create a new user"
  end

  test "should NOT create a user without first_name or last_name" do
    user = User.new
    user.username = "juancruz"
    user.password = "password"
    user.password_confirmation = "password"

    assert_not user.save, "Created a new user without first name or last name"
  end

  test "should NOT create a user without username" do
    user = User.new
    user.first_name = "Juan"
    user.last_name = 'Cruz'
    user.password = "password"
    user.password_confirmation = "password"

    assert_not user.save, "Created a new user without username"
  end

  test "should NOT create a with unmatch password and password confirmation" do
    user = User.new
    user.first_name = "Juan"
    user.last_name = 'Cruz'
    user.username = "juancruz"
    user.password = "password"
    user.password_confirmation = "wrongpassword"

    assert_not user.save, "Created a new user without unmatched password confirmation"
  end

  test "user should be authenticable" do
    user = users(:one)
    assert(user.authenticate('password'))
  end
end
