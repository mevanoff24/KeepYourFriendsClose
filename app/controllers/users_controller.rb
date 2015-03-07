class UsersController < ApplicationController
  def new
  end

  def create
    # @group = Group.find(params[:group_id])
    # @user = User.find_by(name: params[:name])
    # if @group.users.find_by(name: params[:name]) == nil
    #   render inline: '', status: 418
    # elsif @user
    #   @group.users << @user
    # else
    #   render inline: '', status: 400
    # end
  end

  def update

  end

  def edit
  end

  def destroy
  end

  def index
    @users = []
    group = Group.find(params[:group_id])
    group.users.each do |user|
      if user.id != current_user.id
        @users << user
      end
    end
      render json: @users, status: 200
  end

  def show
    p params[:id]
    @user = User.find(params[:id])

    @user.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
    p @user.latitude
  end

end
