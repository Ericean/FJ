class SessionsController < ApplicationController
skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
  	admin= Admin.find_by(name:params[:admin][:name])
  	password= params[:admin][:password]

  	if admin && admin.authenticate(password)
  		session[:admin_id]= admin.id
  		redirect_to root_path, notice: "Logged in!!"
  	else
  		redirect_to login_path, alert: "Invalid credentials!"
  	end

  end

  def destroy
  	reset_session
  	redirect_to login_path, notice: "You have logged out!"
  end

end
