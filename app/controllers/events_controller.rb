class EventsController < ApplicationController
skip_before_action :require_user, only: [:index,]
before_filter :current_user
  
def index
@event = Event.where("date > ?", Time.zone.now.beginning_of_day)
@events = @event.sort_by {|h| h[:date]}
@pastevent = Event.where("date < ?", Time.zone.now.beginning_of_day)
@pastevents = @pastevent.sort_by {|h| h[:date]}
end

def show
# do something with params
@event = Event.find_by(id: params["id"])
@reservations = @event.reservations
@eventend = @event.time + (60*60*2)
end

def new
@event = Event.new
end

def create
event_params = params.require(:event).permit(:category_id, :title, :description, :date, :time, :location)
  @event = Event.create(event_params)
  @event.user_id = current_user.id
  @event.save
    if @event.valid?
      redirect_to events_path, notice: "Event created successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      Event.name
    end
end

def edit
# do something with params
@event = Event.find_by(id: params["id"])
end

def update
event_params = params.require(:event).permit(:category_id, :title, :description, :date, :time, :location)
 @event = Event.find_by(id: params["id"])
    if @event.update_attributes(event_params)
      redirect_to event_path, notice: "Event updated"
    else 
      render "new", alert: "Please recheck the errors below"
      Event.name
    end
end

def destroy
  @event = Event.find_by(id: params["id"])
    @event.destroy
    redirect_to events_path, notice: "Event deleted"
end


end
