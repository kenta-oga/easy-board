class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to group_post_path(@comment.post.group.id, @comment.post_id)
    else
      @post = @comment.post
      @group = @post.group
      @comments = @post.comments
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
