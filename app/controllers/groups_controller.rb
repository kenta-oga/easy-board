class GroupsController < ApplicationController
  before_action :authenticate_user!
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

  def self.search(search)
    # if search != ""
    #   Tweet.where('text LIKE(?)', "%#{search}%")
    # else
    #   Tweet.all
    # end
  end

  private

  def group_params
    params.require(:group).permit(:name, :passcode, user_ids: [])#.merge(user_id: current_user.id)
  end
end
