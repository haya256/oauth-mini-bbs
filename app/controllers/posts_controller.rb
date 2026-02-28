class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      @posts = Post.includes(:user).order(created_at: :desc)
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
