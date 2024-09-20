class AuthController < ApplicationController

  def register
    @user = User.new
  end

  def add_user
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: 'User registered successfully'
    else
      # flash.now[:alert] = 'Username or Email has already been taken' if @user.errors[:username].any? || @user.errors[:email].any?      
      render :register
    end
  end

  def login
    @user = User.new
  end

  def authenticate
    user = User.find_by(email: params[:login]) || User.find_by(username: params[:login])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid username or email and password combination'
      @user = User.new
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
