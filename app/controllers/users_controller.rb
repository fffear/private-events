class UsersController < ApplicationController
  before_action :requires_no_login!, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.includes(:created_events).find(params[:id])
    @prev_events = @user.previous_events
    @upcoming_events = @user.upcoming_events
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
