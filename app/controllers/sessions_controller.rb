class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      flash[:success] = 'Authenticated Successfully'

      redirect_to @user
    else
      flash[:warning] = 'Invalid Credentials'

      redirect_to root_path
    end
  end

  def destroy
    sign_out

    redirect_to root_path
  end
end