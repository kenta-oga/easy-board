class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', {content: @comment, user: @comment.user.name}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      redirect_show
      return
    end
    if @comment.destroy
      redirect_show
    else
      render_show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def redirect_show
    redirect_to group_post_path(@comment.post.group.id, @comment.post_id)
  end

  def render_show
    @post = @comment.post
    @group = @post.group
    @comments = @post.comments
    render 'posts/show'
  end
end
