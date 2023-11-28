class PostsController < ApplicationController

  before_action :set_channel, only: :create

  def create
    @post = Post.new(post_params)
    @post.channel = @channel
    @post.user = current_user

    if @post.save
      # get this checked
      redirect_to channel_path(@channel)
    else
      render "channel/show", status: :unprocessable_entity
    end
  end

  private


  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
