class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.create(group_params)
    @group.user_ids << current_user.id
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
