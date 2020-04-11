class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      flash[:success] = 'You have successfully logged in'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid Username'
      render :new
    end
  end

  def destroy
    @current_user = nil
    redirect_to login_path
  end
end
