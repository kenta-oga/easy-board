class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @group = Group.new
    @users = User.all.where.not(id: current_user.id)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
end
