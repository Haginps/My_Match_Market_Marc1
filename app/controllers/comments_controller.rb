class CommentsController < ApplicationController
  before_action :set_channels, only: %i[new create]

  def new
    @channels = Channels.find(params[:channels_id])
    @comments = Comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.channels = @channels
    @comment.user_id = current_user.id

    if @comment.save
      # update this
      # redirect_to goat_path(@channels.goat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # update this
    # redirect_to dashboard_path, status: :see_other
  end


end
