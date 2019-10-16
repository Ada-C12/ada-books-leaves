class UsersController < ApplicationController
  # app/controllers/users_controller.rb
  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{username}"
      # flash[:goblin] = "The Goblin is HERE"
      # flash[:warning] = "The number 2"
      # flash[:error] = "I'm number 1"
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{username}"
    end
  
    redirect_to root_path
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

end
