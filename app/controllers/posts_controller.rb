class PostsController < ApplicationController
  def index
    @post = Post.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @post = @room.posts.new(post_params)
    if @post.save
      redirect_to room_posts_path(@room)
    else  
      render :index
    end
  end

  private
  params.require(:post).permit(:content).merge(user_id: current_user.id)
end
