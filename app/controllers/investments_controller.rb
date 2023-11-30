class InvestmentsController < ApplicationController
  def index
    if params[:query].present?
      @investments = Investment.global_search(params[:query]).try(:includes, :histories)
    else
      @investments = Investment.all.try(:includes, :histories)
    end
  end

  def show
    @investment = Investment.find(params[:id])
    @holding = Holding.new

    @on_hold = false
    @purchased_price = {}

    current_user.holdings.each do |holding|
      if holding.investment == @investment
        @current_holding = holding

        unless @current_holding.purchased_price.nil?
          @on_hold = true
          @sold = false
        end

        unless @current_holding.sold_price.nil?
          @on_hold = false
          @sold = true
        end

        @purchased_price[@current_holding.purchased_date.strftime('%Y-%m-%d')] = @current_holding.purchased_price
      end
    end

    # raise
  end
end
