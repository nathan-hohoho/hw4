class ApplicationController < ActionController::Base
  # This makes sure the method runs before every single page load
  before_action :current_user

  def current_user
    # Use find_by so it returns nil (instead of crashing) if the ID is wrong
    @current_user = User.find_by({ "id" => session["user_id"] })
  end
end