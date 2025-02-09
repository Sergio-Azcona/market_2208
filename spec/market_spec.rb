require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  let(:market) { Market.new("South Pearl Street Farmers Market") }
  let(:vendor1) { Vendor.new("Rocky Mountain Fresh") }
  let(:vendor2) { Vendor.new("Ba-Nom-a-Nom") }
  let(:vendor3) { Vendor.new("Palisade Peach Shack") }
  let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
  let(:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
  let(:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }
  let(:item5) { Item.new({name: "Banana Nice Cream", price: "$3.25"}) }


  it 'exisits as a class and has a name and vendors'do
    expect(market).to be_a Market
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it "can add vendors, inform vendor's name, and inform what vendors have a given items" do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
    
    market.add_vendor(vendor1)    
    market.add_vendor(vendor2)    
    market.add_vendor(vendor3)

    expect(market.vendors).to eq([vendor1,vendor2,vendor3])
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])

    expect(market.vendors_that_sell(item1)).to eq([vendor1,vendor3])
    expect(market.vendors_that_sell(item4)).to eq([vendor2])
    expect(market.vendors_that_sell(item3)).not_to include([vendor1,vendor3])
  end

  it 'names all items Vendors have in stock, sorted alphabetically'do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item5, 55)
    vendor3.stock(item1, 11)
    market.add_vendor(vendor1)    
    market.add_vendor(vendor2)    
    market.add_vendor(vendor3)
    expect(market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
  end

  it 'informs if more than 1 vendor sells an item and AND the total quantity is greater than 50' do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
    vendor3.stock(item3, 10)
    
    market.add_vendor(vendor1)    
    market.add_vendor(vendor2)    
    market.add_vendor(vendor3)
    expect(market.overstocked_items).to eq([item1])
  end

  #hash with items as keys and hash as values - this sub-hash should have two key/value pairs: quantity pointing to total inventory for that item and vendors pointing to an array of the vendors that sell that item
  xit 'reports the quantities of all items sold at the market' do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
    vendor3.stock(item3, 10)
    
    market.add_vendor(vendor1)    
    market.add_vendor(vendor2)    
    market.add_vendor(vendor3)

    
    expect(market.total_inventory).to eq()
  end



end