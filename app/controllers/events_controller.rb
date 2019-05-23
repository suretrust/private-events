# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_login, only: :index

  def index
    @previous_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find params[:id]
    @attendees = @event.attendees
  end
  
  def new
    @event = current_user.events.new
  end
  
  def create
    @event = current_user.events.create event_params
    redirect_to @event
  end

  def update
    @event = Event.find params[:id]
    @event.attendees << current_user
    flash.now[:success] = 'You have been enrolled'
    redirect_to current_user 
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
