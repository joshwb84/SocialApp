class EventsController < ApplicationController
skip_before_action :require_user, only: [:index,]

  
def index
@events = Event.where("date > ?", Time.zone.now.beginning_of_day)
@pastevents = Event.where("date < ?", Time.zone.now.beginning_of_day)

end

def show
# do something with params
@event = Event.find_by(id: params["id"])
end

def new
@event = Event.new
end

def create
event_params = params.require(:event).permit(:category_id, :title, :description, :date, :time, :location)
  @event = Event.create(event_params)
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
