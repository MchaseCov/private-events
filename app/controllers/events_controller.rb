class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event =  current_user.created_events.build
    @user = current_user
  end

  def create
    @event = current_user.created_events.build(event_params)
    @user = current_user
    if @event.save
      redirect_to events_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :location, :creator_id)
  end
end
