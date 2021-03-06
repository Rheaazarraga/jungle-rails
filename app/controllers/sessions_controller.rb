class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # save the user id inside the browser cookie- this keeps the user logged in when they navigate around the site
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if user's login doesn't work, send them back to the login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signup'
  end

end
