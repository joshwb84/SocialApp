class UsersController < ApplicationController
skip_before_action :require_user, only: [:new, :create, :show]

def index
# @users = User.all 
end

def show
# do something with params
@user = User.find_by(id: params["id"])
end

def new
@user = User.new
end

def create
user_params = params.require(:user).permit!
  @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path, notice: "You're account was created successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      User.name
    end
end

def edit
@user = User.find_by(id: params["id"])
end

def update
user_params = params.require(:user).permit!
  @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path, notice: "You're account was created successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      User.name
    end
end

def destroy
 @user = Event.find_by(id: params["id"])
    @user.destroy
    redirect_to root_path
end


end
