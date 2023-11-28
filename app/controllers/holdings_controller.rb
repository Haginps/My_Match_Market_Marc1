class HoldingsController < ApplicationController

  def create
    @asset = Asset.find(params[:asset_id])
    @holding = Holding.new(holding_params)

    @holding.user = current_user
    @holding.asset = @asset
    @holding.save
  end

  private

  def holding_params
    params.require(:holding).permit(:shares_amount, :purchased_price)
  end
end
