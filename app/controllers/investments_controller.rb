class InvestmentsController < ApplicationController
  def index
    # @investments = Investment.includes(:histories).all
    # @investments.each do |investment|
    #   investment.calculate_24hr_change
    # end
    @investments = Investment.all
  end

  def show
    @investment = Investment.find(params[:id])
    @holding = Holding.new

    @on_hold = false
    current_user.holdings.each do |holding|
      if holding.investment == @investment
        @on_hold = true
        @current_holding = holding
      end
    end
  end
end
