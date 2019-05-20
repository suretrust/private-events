# frozen_string_literal: true

module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user
  end
end
