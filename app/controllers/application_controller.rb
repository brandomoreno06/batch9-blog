class ApplicationController < ActionController::Base
  include ApplicationHelper

  helper_method :user_logged_in?, :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def authenticate!
    redirect_to login_path, alert: "Sorry, you are not signed in." and return unless user_logged_in?
  end

  def record_not_found
    redirect_to root_path, alert: "The page you are trying to access does not exist."
  end
end
