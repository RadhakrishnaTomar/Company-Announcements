class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def user_show
    @user = User.find(params[:id])
  end

  def users_index
    @users = User.where.not(id: current_user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.profile_comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_show_path(@user), notice: 'Comment posted successfully.'
    else
      redirect_back(fallback_location: user_show_path(@user), alert: 'Comment could not be posted.')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @user = @comment.commentable

    if @comment.user == current_user || current_user.admin?
      @comment.destroy
    end

    redirect_back(fallback_location: user_show_path(@user))
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end