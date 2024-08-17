class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to request.referer || root_path, notice: 'Comment posted successfully.'
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

  def find_commentable
    if params[:post_id]
      Post.find(params[:post_id])
    elsif params[:user_id]
      User.find(params[:user_id])
    end
  end
end
