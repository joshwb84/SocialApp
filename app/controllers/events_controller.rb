class EventsController < ApplicationController
def index
@events = Event.all 

end

def show
# do something with params
@event = Event.find_by(id: params["id"])

end

def new
end

def create
# do something with params
end

def edit
# do something with params
end

def update
# do something with params
end

def destroy
# do something with params
end

end
