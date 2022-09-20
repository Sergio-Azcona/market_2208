class Market
  attr_reader :name,:vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(new_vendor) 
    @vendors.push(new_vendor)
  end

  def vendor_names
    vendor_name_list = []
    @vendors.select do |vendor|
      vendor_name_list.push(vendor.name)
    end
    vendor_name_list
  end

  def vendors_that_sell(sought_item)
    vendor_with_item = []
    @vendors.select do |vendor|
      if vendor.inventory.include?(sought_item) == true
        vendor_with_item << vendor
      end
    end
    vendor_with_item
  end

  def sorted_item_list
    sorted_goods = Set.new
    @vendors.find_all do |vendor|
      vendor.inventory.each do |item, quantity|
        sorted_goods << item.name 
      end
    end
    sorted_goods.sort
  end


  def overstocked_items
    item_overflow = []
    
    @vendors.each do |vendor|
       
      vendor.inventory.find_all do |item, stock|
        if stock > 50
          item_overflow << item.name 
        
          # if item_overflow
        # require 'pry';binding.pry
          # end

        end
     end
    end
  end

end