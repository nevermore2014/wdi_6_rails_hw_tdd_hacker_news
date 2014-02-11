class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.create!(posts_params)
    @post.save!
    redirect_to user_posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body)
  end

end