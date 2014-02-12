class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :get_user, only: [:show]
  def index
    if !current_user
      @posts = Post.all
    else
      @posts = current_user.posts
    end
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.create!(posts_params)
    @post.save!
    current_user.posts << @post
    redirect_to user_posts_path
  end

  def show
    @user = current_user
    @post = current_user.posts.find(params[:id])

  end

  private

  def posts_params
    params.require(:post).permit(:title, :body)
  end

  def get_user
    @user = current_user
  end

end