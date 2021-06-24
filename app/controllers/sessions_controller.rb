class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)

      flash[:success] = 'Authenticated Successfully'
    else
      flash[:warning] = 'Invalid Credentials'
    end

    redirect_to root_path
  end

  def destroy
    sign_out

    redirect_to root_path
  end
end
