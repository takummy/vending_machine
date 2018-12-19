class Beverage
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def info
    "#{@name}#{@price}円"
  end
end