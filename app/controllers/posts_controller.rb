class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    head :no_content
  end

  def fill_database
    result = API::CrowdTangleApi.get_data("r")
    API::CrowdTangleApi.import(result)
    head :no_content
  end
end
