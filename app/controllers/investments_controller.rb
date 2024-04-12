class InvestmentsController < ApplicationController
  def index
    if params[:query].present?
      @investments = Investment.global_search(params[:query]).includes(:histories)
    else
      @investments = Investment.includes(:histories).all
    end

    @top_players = filter_players_by_category("Top Players", [])
    @emerging_players = filter_players_by_category("Emerging Players", @top_players)
    @trending_players = filter_players_by_category("Trending Players", @top_players + @emerging_players)

    assign_players_to_category(["Lionel Messi", "Erling Haaland", "Reece James", "Trent AA"], @top_players)
    assign_players_to_category(["Anthony Elanga", "Michael Olise", "Cole Palmer", "Anthony Gordon"], @emerging_players)
    assign_players_to_category(["Darwin Nunez", "Jarrod Bowen", "Matheus Cunha", "Willian"], @trending_players)
  end

  def show
    @investment = Investment.find(params[:id])
    @holding = Holding.new

    @on_hold = false
    @purchased_histories = []

    if user_signed_in?
      current_user.holdings.each do |holding|
        if holding.investment == @investment
          @current_holding = holding

          unless @current_holding.purchased_price.nil?
            @on_hold = true
            @sold = false

            current_user.trade_histories.each do |history|
              @purchased_record = {}

              @purchased_date = history.date.strftime("%d %b") if history.holding == holding
              @purchased_price = holding.investment.histories.find_by(date: history.date).price if history.holding == holding

              @purchased_record[@purchased_date] = @purchased_price

              @purchased_histories.push(@purchased_record)
            end

            @purchased_histories = @purchased_histories.drop(1)
          end

          unless @current_holding.sold_price.nil?
            @on_hold = false
            @sold = true

            @purchased_histories = []
          end
        end
      end
      @user_tokens = current_user.user_histories.find_by(date: Date.today).tokens
    end

    if @investment.category == "player"
      @player = Player.find_by(investment: @investment)
    end
  end

  private

  def filter_players_by_category(category, excluded_players)
    Investment.joins(:player).where(category: "player").where.not(id: excluded_players).order(created_at: :desc).limit(10)
  end

  def assign_players_to_category(player_names, category_players)
    players = Investment.where(name: player_names).where.not(id: category_players.pluck(:id)).limit(player_names.length)
    category_players + players.to_a
  end
end
