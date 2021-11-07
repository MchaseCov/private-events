class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :find_event, only: %i[show edit update destroy]
  before_action :assign_user, only: %i[new create show edit update destroy]

  def index
    @events = Event.upcoming.search(params[:search])
    return if params[:search].nil?

    flash.now[:notice] = "Now only showing events located in #{params[:search]}!"
  end

  def past
    @events = Event.past.all
  end

  def new
    @event =  current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show; end

  def edit
    authenticate_id
  end

  def update
    if @event.update(event_params)
      flash[:notice] = 'Event updated successfully! Be sure to inform your attendees of the changes.'
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    authenticate_id
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :location, :creator_id,:search)
  end

  def authenticate_id
    return if @user.id == @event.creator_id

    flash[:error] = 'Only the creator of this event can make changes.'
    redirect_to event_path(@event)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def assign_user
    @user = current_user
  end
end
