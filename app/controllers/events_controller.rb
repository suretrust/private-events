class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = current_user.events.find params[:id]
  end

  def create
    @event = current_user.events.create event_params
  end

  def new
    @event = current_user.events.new
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :date)
  end
end
