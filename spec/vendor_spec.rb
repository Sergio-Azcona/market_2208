require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  let(:vendor) { Vendor.new("Rocky Mountain Fresh") }

  it 'is an existing class with name attribute'do
    expect(vendor).to be_a Vendor
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

    # vendor.inventory
    # #=> {}

    # vendor.check_stock(item1)
    # #=> 0

    # vendor.stock(item1, 30)

    # vendor.inventory
    # #=> {#<Item:0x007f9c56740d48...> => 30}

    # vendor.check_stock(item1)
    # #=> 30

    # vendor.stock(item1, 25)

    # vendor.check_stock(item1)
    # #=> 55

    # vendor.stock(item2, 12)

    # vendor.inventory

end