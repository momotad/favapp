class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to '/'
    end
  end

    private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:id])
  end

end
