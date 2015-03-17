class EventsController < ApplicationController
skip_before_action :require_user, only: [:index,]
before_filter :current_user
before_action :find_event
before_action :event_params, only: [:create, :update]
helper_method :sort_column, :sort_direction
  
def index
@event = Event.where("date > ?", Time.zone.now.beginning_of_day)
@events = @event.order(sort_column + " " + sort_direction)

@pastevent = Event.where("date < ?", Time.zone.now.beginning_of_day)
@pastevents = @pastevent.sort_by {|h| h[:date]}
end

def show
# do something with params
@reservations = @event.reservations
@reservation = Reservation.new
@eventend = @event.time + (60*60*2)
end

def new
@event = Event.new
end

def create
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
end

def update
    if @event.update_attributes(event_params)
      redirect_to event_path, notice: "Event updated"
    else 
      render "new", alert: "Please recheck the errors below"
      Event.name
    end
end

def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted"
end

def find_event
  @event = Event.find_by(id: params["id"])
end

def event_params
  event_params = params.require(:event).permit(:category_id, :title, :description, :date, :time, :location)
end

private

def sort_column
  Event.column_names.include?(params[:sort]) ? params[:sort] : "Date"
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

end

