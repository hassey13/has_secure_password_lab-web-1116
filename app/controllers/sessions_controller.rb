class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = 'Username or password was incorrect'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out!'
    redirect_to login_path
  end

end
