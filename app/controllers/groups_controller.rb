class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :group_find, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @group = Group.new
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
    if @group.update(group_params)
      redirect_to group_posts_path(@group.id)
    else
      render :edit
    end
  end

  def destroy
    if @group.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def group_find
    @group = Group.find(params[:id])
  end
end
