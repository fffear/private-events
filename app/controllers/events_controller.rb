class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.includes(:creator).find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :description)
    end
end
