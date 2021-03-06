class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'User has been Successfully created !!'
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user.errors.messages.empty?
      flash.now[:danger] = 'An Unknown Error Has Occurred, Please Refresh the page!!'
      render :new
    else
      flash[:warning] = @user.errors.full_messages
      redirect_to request.referrer
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to home_path unless logged_in? && @user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
