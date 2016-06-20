class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by &:date
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    head :no_content
  end

  def update_database
    API::CrowdTangleApi.call
    @posts = Post.all.sort_by &:date
    head :no_content
  end
end
