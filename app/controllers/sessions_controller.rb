class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)
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
    session[:user_id] = nil
    redirect_to home_path
  end
end
