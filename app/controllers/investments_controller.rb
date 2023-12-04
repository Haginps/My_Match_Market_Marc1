class InvestmentsController < ApplicationController
  def index
    if params[:query].present?
      @investments = Investment.global_search(params[:query]).try(:includes, :histories)
    else
      @investments = Investment.all.try(:includes, :histories)
    end

    @top_players = filter_players_by_category('Top Players', [])
    @emerging_players = filter_players_by_category('Emerging Players', @top_players)
    @trending_players = filter_players_by_category('Trending Players', @top_players + @emerging_players)

    assign_players_to_category(['Lionel Messi', 'Erling Haaland', 'Reece James', 'Trent Alexander-Arnold'], @top_players)
    assign_players_to_category(['Anthony Elanga', 'Michael Olise', 'Cole Palmer', 'Anthony Gordon'], @emerging_players)
    assign_players_to_category(['Darwin Nunez', 'Jarrod Bowen', 'Matheus Cunha', 'Willian'], @trending_players)
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

        @purchased_price[@current_holding.purchased_date.strftime('%d %b')] = @current_holding.purchased_price
      end
    end

    if @investment.category == 'player'
      @player = Player.find_by(investment: @investment)
    end
  end

  private

  def filter_players_by_category(_category, _excluded_players)
    []
  end

  def assign_players_to_category(player_names, category_players)
    players = @investments.where(name: player_names).where.not(id: category_players).limit(player_names.length)
    category_players.concat(players)
  end
end
