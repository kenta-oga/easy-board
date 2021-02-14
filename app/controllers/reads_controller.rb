class ReadsController < ApplicationController
  def create
    if @read = current_user.reads.create(post_id: params[:post_id])
      redirect_to group_posts_path(group_id: params[:group_id])
    else
      render 'posts/show'
    end
  end

  def destroy
    @read = Read.find_by(post_id: params[:post_id], user_id: current_user.id) 
    if @read.destroy
      redirect_to group_posts_path(group_id: params[:group_id])
    else
      render 'posts/show'
    end
  end
end
