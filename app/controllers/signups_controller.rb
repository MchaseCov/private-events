class SignupsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @signup = Signup.new(attendee_id: current_user.id, attended_event_id: @event.id)
    if @signup.save
      flash[:notice] = 'You have signed up for this event!'
    else
      flash[:alert] = "Error! Could not sign you up for this event. #{current_user.id} #{@event.id}"
    end
    redirect_to event_path(@event)
  end

  def remove
    @event = Event.find(params[:event_id])
    signup = Signup.find_by(attendee_id: current_user.id, attended_event_id: @event.id)
    signup.destroy
    flash[:notice] = 'You are no longer attending this event.'
    redirect_to event_path(@event)
  end
end
