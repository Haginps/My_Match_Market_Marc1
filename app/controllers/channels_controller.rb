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

    if current_user
      @channel.user = current_user

      if @channel.save
        @channels = current_user.channels
        redirect_to channel_path(@channel), notice: "Channel created successfully"
      else
        @channels = current_user.channels
        render :index, status: :unprocessable_entity
      end
    else
      # Handle the case where current_user is nil
      redirect_to root_path, alert: "User not found."
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
