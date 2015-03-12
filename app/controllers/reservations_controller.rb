class ReservationsController < ApplicationController
skip_before_action :require_user
before_action :find_event

def index
end

def show
end

def new
@reservation = Reservation.new
end

def create
reserv_params = params.require(:reservation).permit(:comment)
  @reservation = @event.reservations.new(reserv_params)
  @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to @event, notice: "Your spot has been reserved"
    else 
      redirect_to @event, alert: "Something went wrong"
    end
end



def edit
end

def update
end

def destroy
end

def find_event
    @event = Event.find_by(id: params["event_id"])
end


end
