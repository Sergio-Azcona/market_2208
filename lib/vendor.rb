class Vendor
  attr_reader :name,:inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(given_item)
    @inventory[given_item]
  end

  def stock(add_item,add_quantity)
    @inventory[add_item] += add_quantity
  end

  def potential_revenue
    expected_income = 0
    @inventory.sum do |item, stock|
      expected_income += item.price.delete("$").to_f * stock
    end
    expected_income 
  end


end