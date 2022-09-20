require './lib/item'
# require './lib/vendor'

RSpec.describe Item do
  let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }

  it 'is a class that exists and has name and price attributes'do
    expect(item1).to be_an_instance_of Item
    expect(item1.price).to be_a String
    expect(item2.name).to eq('Tomato')
    expect(item2.price).to eq('$0.50')
  end

end