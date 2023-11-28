class ChannelsController < ApplicationController
  def index

  end

  def show

  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.user = current_user
    @channel.save
    # update this
    # redirect_to channel_path(@channel), notice: "Channel created successfully"
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
  end

  private

  def channel_params
    # update this
    # params.require(:channel).permit(:name, :photo, :price, :description, :location)
  end

end
