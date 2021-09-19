ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # def current_user
  #   @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  # end

  # def user_logged_in?
  #   !!current_user
  # end

  # def authenticate!
  #   redirect_to root_path and return unless user_logged_in?
  # end

  def sign_in(user)
    post login_path, params: { username: user.username, password: user.password }
  end
end
