# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @previous_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find params[:id]
    @attendees = @event.attendees
  end

  def create
    @event = current_user.events.create event_params
    redirect_to @event
  end

  def new
    @event = current_user.events.new
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end
end
