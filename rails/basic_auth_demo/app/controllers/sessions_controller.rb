class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def login
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def welcome
  end
end
