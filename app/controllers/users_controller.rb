class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)

    if @user.save
      flash[:success] = 'Created Successfully'

      redirect_to @user
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
