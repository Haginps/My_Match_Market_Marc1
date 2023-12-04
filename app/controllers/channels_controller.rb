class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order(created_at: :desc)

    @channel = Channel.new
  end


  def show
    # @channel = Channel.find(params[:id])
    # @comment = Comment.new
    @post = Post.new

    # @post = Post.find(params[:id])
    # @comments = @post.comments.order(created_at: :desc)
    # @comment = Comment.new

    @channel = Channel.find(params[:id])
    @comment = Comment.new


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

  def create_comment
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment added successfully.'
    else
      @comments = @post.comments.order(created_at: :desc)
      render 'show'
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

  def comment_params
    params.require(:comment).permit(:content)
  end

end
