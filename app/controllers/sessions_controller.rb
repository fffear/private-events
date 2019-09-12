class SessionsController < ApplicationController
  before_action :requires_no_login!, only: %i(new create)

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in(@user)
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to @user
    else
      flash.now[:errors] = ["Invalid name"]
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
