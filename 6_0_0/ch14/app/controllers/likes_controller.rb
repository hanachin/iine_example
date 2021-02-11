class LikesController < ApplicationController
  before_action :logged_in_user

  def index
    @user = current_user
    @title = 'Likes'
    @likes = current_user.likes.preload(:micropost).order(created_at: :desc).paginate(page: params[:page])
  end

  def update
    @micropost = micropost
    @like = current_user.like(@micropost)
  end

  def destroy
    @micropost = micropost
    current_user.unlike(@micropost)
    @like = nil
  end

  private
    def micropost
      Micropost.find(params[:micropost_id])
    end
end
