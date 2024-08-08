class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = Post.find(params[:post_id]) if params[:post_id]
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_back(fallback_location: root_path, alert: 'Comment could not be posted.')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
