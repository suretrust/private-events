# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_to_home_if_already_signed_in, only: [:new]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'You have successfully signed up!'
      redirect_to events_path
    else
      render new_user_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    @enrolled_upcoming_events = @user.enrolled_events.upcoming_events
    
    get_user_previous_events
    get_user_upcoming_events
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def redirect_to_home_if_already_signed_in
    redirect_to events_path if logged_in?
  end

  def get_user_previous_events
    @previous_events = @user.events.previous_events
  end

  def get_user_upcoming_events
    @upcoming_events = @user.events.upcoming_events
  end
  
end

