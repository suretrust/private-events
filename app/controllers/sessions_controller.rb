# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      login(user)
      flash[:success] = 'You have successfully signed in!'
      redirect_to events_path
    else
      flash.now[:error] = "Invalid login credentials"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
