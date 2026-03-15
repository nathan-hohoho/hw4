class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user && @user.authenticate(params["password"])
      # 3. If successful, "log them in" by saving their ID in the session
      session["user_id"] = @user.id
      flash["notice"] = "Welcome, #{@user.username}!"
      redirect_to "/places"
    else
      # 4. If unsuccessful, send them back to the login page
      flash["notice"] = "Invalid email or password."
      redirect_to "/login"
  end

  def destroy
  end
end
  