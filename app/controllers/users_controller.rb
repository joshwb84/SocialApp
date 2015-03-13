class UsersController < ApplicationController
skip_before_action :require_user, only: [:new, :create, :show]
before_action :find_user
skip_before_action :user_params, except: [:create, :update]

def index
redirect_to root_path, notice: "Only administrators can see that page"
# @users = User.all 
end

def show
# do something with params
end

def new
@user = User.new
end

def create
  @user = User.create(user_params)
    if @user.valid?
      redirect_to root_path, notice: "You're account was created successfully"
    else 
      render "new"
      User.name
    end
end


def edit
end

def update
    if @user.update_attributes(user_params)
      redirect_to user_path, notice: "You're account was updated successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      User.name
    end
end

def destroy
    @user.destroy
    redirect_to root_path
end

def find_user
 @user = User.find_by(id: params["id"])
end

def user_params
user_params = params.require(:user).permit(:name, :email, :tandc, :description, :facebook, :avatar, :password, :avatar_file_name)
end


end
