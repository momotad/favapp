class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @app = App.find(params[:id])
    if @comment.save
      CommentChannel.broadcast_to @app, { comment: @comment, user: @comment.user }
    end
  end

    private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:id])
  end

end
