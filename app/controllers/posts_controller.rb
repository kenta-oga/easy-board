class PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  def index
    @group = Group.find(params[:group_id])
    @posts = @group.posts.includes(:user)
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :content).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def post_find
    @post = Post.find(params[:id])
  end
end

