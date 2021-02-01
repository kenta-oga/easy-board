class ReadsController < ApplicationController
  def create
    @read = current_user.reads.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @read = Read.find_by(post_id: params[:post_id], user_id: current_user.id)
    @read.destroy
    redirect_back(fallback_location: root_path)
  end
end
