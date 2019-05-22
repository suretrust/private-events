# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      login(user)
      redirect_to events_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
