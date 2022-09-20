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

end