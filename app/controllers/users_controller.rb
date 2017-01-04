class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:notice] = 'Error'
          redirect_to login_path
        end
    else
      flash[:notice] = 'Passwords do not match'
      redirect_to action: 'new'
    end

  end

  def show

  end

private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
