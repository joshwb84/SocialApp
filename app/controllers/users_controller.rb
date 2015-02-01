class UsersController < ApplicationController

def index
  #want to redirect to Signin page

end

def show
# do something with params
@user = user.find_by(id: params["id"])
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
