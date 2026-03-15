class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    # Bcrypt handles the encryption automatically because of has_secure_password
    @user["password"] = params["user"]["password"] 
    @user.save

    # LOG THE USER IN: This is the missing piece!
    session["user_id"] = @user.id

    flash["notice"] = "Thanks for signing up, #{@user["username"]}!"
    redirect_to "/places"
  end
end
