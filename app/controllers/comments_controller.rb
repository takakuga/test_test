class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    if comment.save
      redirect_to root_path
    else
    render :show
  end

  private
  def comment_params
    params.require(:comment).permit(content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
