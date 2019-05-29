# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end

  def logged_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
