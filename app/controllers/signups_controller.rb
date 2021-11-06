class SignupsController < ApplicationController


  def create
    @event = Event.find(params[:event_id])
    @signup = Signup.new(attendee_id: current_user.id, attended_event_id: @event.id)
    if @signup.save
      flash[:notice] = 'You have signed up for this event!'
    else
      flash[:alert] = 'Error! Could not sign you up for this event.'
    end
    redirect_to event_path(@event)
  end
end
