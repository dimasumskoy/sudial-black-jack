require_relative 'cards'
require_relative 'diler'
require_relative 'gamer'
require_relative 'user'

class Game
  def start # Запрос имени, создание игроков, раздача карт, подсчет текущих очков
    puts "Welcome to BlackJack"
    print "Enter your name: "
    @gamer_name = gets.chomp

    create_user
    create_diler
    deal_cards
    total_points
  end

  def create_user
    @user = User.new(@gamer_name)
  end

  def create_diler
    @diler = Diler.new
  end

  def deal_cards
    2.times do
      @user.take_card(Cards.new)
      @diler.take_card(Cards.new)
    end
  end

  def total_points
    @user.cards.each { |card| @user.points_amount += card.point }
    @diler.cards.each { |card| @diler.points_amount += card.point }
  end
end
