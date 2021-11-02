class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
    render 'prototypes/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id],prototype_id: params[:prototype_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
