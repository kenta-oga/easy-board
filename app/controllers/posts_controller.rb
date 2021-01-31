class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  before_action :group_find, only: [:index, :new, :create, :show, :edit, :update]
  before_action :move_root, only: [:edit, :update, :destroy]
  def index
    @posts = @group.posts.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to group_posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to group_post_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :content).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def post_find
    @post = Post.find(params[:id])
  end

  def group_find
    @group = Group.find(params[:group_id])
  end

  def move_root
    redirect_to root_path if current_user.id != @post.user_id
  end
end
