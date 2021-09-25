require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: 'username', first_name: "first", last_name: "last", password: "password", password_confirmation: "password")
    post login_path, params: { username: @user.username, password: @user.password }
  end

  test "should go to /signup path" do
    delete delete_session_path
    get new_user_path
    assert_response :success
  end

  test "should go to /account path" do
    get user_account_path
    assert_response :success
  end

  test "should create a user" do
    delete delete_session_path
    assert_difference "User.count", 1, "Failed to create a user" do
      post create_user_path, params: { user: {
                                          first_name: "String",
                                          last_name: "String",
                                          username: "String",
                                          password: "Password",
                                          password_confirmation: "Password"
                                        }}
    end
  end

  test "should delete a user" do
    assert_difference "User.count", -1, "Failed to delete user account" do
      delete delete_user_path(@user)
    end
  end

  test "should NOT delete an account if current_user is not the owner" do
    @user = User.create(username: 'not_current_user', first_name: "first", last_name: "last", password: "password", password_confirmation: "password")
    assert_difference "User.count", 0, "Deleted an account not owned by the current user" do
      delete delete_user_path(@user)
    end
  end
end
