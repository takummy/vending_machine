require_relative 'beverage'

class VendingMachine
  attr_reader :coke, :oolong_tea, :redbull

  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @inserted_money = 0
    @coke = Beverage.new("コーラ", 100)
    @oolong_tea = Beverage.new("烏龍茶", 100)
    @redbull = Beverage.new("レッドブル", 200)
  end

  def insert_money(money)
    if AVAILABLE_MONEY.include?(money)
      @inserted_money += money
      puts "#{money}円を入れました"
    else
      puts "#{money}円は使用できません"
    end
  end

  def push_button(beverage)
    case beverage.name
    when "コーラ", "烏龍茶"
      if @inserted_money >= 100
        @inserted_money -= 100
        puts "#{beverage.name}を購入しました!"
      else
        puts "投入額が不足しているため、購入できません！"
      end
    when "レッドブル"
      if @inserted_money >= 200
        @inserted_money -= 200
        puts "#{beverage.name}を購入しました!"
      else
        puts "投入額が不足しているため、購入できません！"
      end
    end
  end

  def display_purchasable_goods
    if @inserted_money >= 200
      puts "#{self.coke.info}" "/" "#{self.oolong_tea.info}" "/" "#{self.redbull.info}"
    elsif @inserted_money >= 100 && @inserted_money <= 200
      puts "#{self.coke.info}" "/" "#{self.oolong_tea.info}"
    else
      puts "金額が不足しています"
    end
  end

  def return_the_change(beverage)
    @change = @inserted_money -= beverage.price
    puts "おつりは#{@change}円です"
  end
end


vm = VendingMachine.new
vm.insert_money(100)
vm.insert_money(100)
vm.display_purchasable_goods
vm.push_button(vm.coke)
