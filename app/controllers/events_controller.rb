class EventsController < ApplicationController
def index
@events = Event.all 

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
  Event.create(event_params)
   redirect_to events_path
end

def edit
# do something with params
@event = Event.find_by(id: params["id"])
end

def update
event_params = params.require(:event).permit(:category_id, :title, :description, :date, :time, :location)
@event = Event.find_by(id: params["id"])
  @event.update(event_params)
    redirect_to event_path
end

def destroy
  @event = Event.find_by(id: params["id"])
    @event.destroy
    redirect_to events_path
end

end
