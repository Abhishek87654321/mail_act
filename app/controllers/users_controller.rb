class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    UserMailer.with(user: @user).welcome_email.deliver_now
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end