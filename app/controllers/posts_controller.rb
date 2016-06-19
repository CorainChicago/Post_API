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
end
