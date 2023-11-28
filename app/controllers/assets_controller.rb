class AssetsController < ApplicationController
  def index
    # @assets = Asset.includes(:histories).all
    # @assets.each do |asset|
    #   asset.calculate_24hr_change
    # end
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
    @holding = Holding.new
  end
end
