class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order(created_at: :desc)

    @channel = Channel.new
  end


  def show
    @channel = Channel.find(params[:id])
    @comment = Comment.new
    @post = Post.new
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.user = current_user
    @channel.save
    @channels = current_user.channels
    if @channel.save
      redirect_to channel_path(@channel), notice: "Channel created successfully"
    else
      @channel = Channel.new
      render :index, status: :unprocessable_entity
    end

  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.posts.destroy_all
    @channel.destroy
    redirect_to channels_path, status: :see_other, notice: 'Channel and associated posts deleted successfully'
  end

  private

  def channel_params
    params.require(:channel).permit(:title, :description, :photo)
  end

end
