class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def destroy
    Post.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fill_database
    result = API::CrowdTangleApi.get_data("r")
    API::CrowdTangleApi.import(result)
    @posts = Post.all
    render :layout => false
    # return @posts.to_json
  end
end
