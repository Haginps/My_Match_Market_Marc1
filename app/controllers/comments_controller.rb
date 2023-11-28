class CommentsController < ApplicationController
  before_action :set_channels, only: %i[new create]

  def create
    @comment = Comment.new(comment_params)
    @comment.channel = @channel
    @comment.user = current_user

    if @comment.save
      # get this checked
      redirect_to channel_path(@channel)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # get this checked
    redirect_to channel_path, status: :see_other
  end

  private

  def set_channels
    @channel = Channel.find(params[:channel_id])
  end

  def comment_params
    # get this checked
    params.require(:comment).permit(:content)
  end



end
