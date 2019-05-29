# frozen_string_literal: true

class EventsController < ApplicationController
  include EventsHelper
  before_action :require_login, only: %i[index new show]

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
    if @event.save
      flash[:success] = 'Event Created!'
      redirect_to @event
    else
      render :new
    end
  end

  def update
    @event = Event.find params[:id]
    @event.attendees << current_user
    flash[:success] = 'Thanks for Enrolling!'
    redirect_to current_user
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end

  def require_login
    redirect_to sign_in_path unless logged_in?
    flash[:error] = 'You must be logged in to create or view events!' unless logged_in?
  end
end
