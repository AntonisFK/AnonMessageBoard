class PostsController < ApplicationController

  before_action :ensure_location, only: [:new, :create]

  def index
  end

  def new
    @post = current_location.posts.build
  end

  def create
    @post = current_location.posts.build(post_params)
    flash.now[:success] if @post.save
  end
  
private

  def post_params
    params.require(:post).permit(:subject, :content)
  end

  def ensure_location
    redirect_to root_url, error: "Please set your location first." unless current_location
  end

end