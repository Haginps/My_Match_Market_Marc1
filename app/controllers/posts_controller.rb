class PostsController < ApplicationController

  before_action :set_channel, only: :create

  def create
    @post = Post.new(post_params)
    @post.channel = @channel
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to channel_path(@channel), notice: 'Post was successfully created.' }
        # format.json { render json: { success: true, post_html: render_to_string(partial: 'posts/post', locals: { post: @post }) } }
      else
        format.html { render "channels/show", status: :unprocessable_entity  }
        # format.json { render json: { success: false, errors: @post.errors.full_messages } }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to channel_path(@post.channel), status: :see_other, notice: 'post and associated posts deleted successfully'
  end

  private


  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :photo)
  end

end
