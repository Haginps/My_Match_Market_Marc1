class CommentsController < ApplicationController
  before_action :set_channel, only: [:create]
  before_action :set_post, only: [:create]


  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save!
      # get this checked
      redirect_to channel_path(@channel)
    else
      render "channel/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    # get this checked
    redirect_to channel_path(@comment.post.channel), status: :see_other
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    # get this checked
    params.require(:comment).permit(:content)
  end
end
