require './spec/spec_helper'

RSpec.describe Auction do
  before(:each) do 
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'exits' do
      expect(@auction).to be_a(Auction)
    end
    it 'empty array for items' do
      expect(@auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'can add items' do
      @auction.add_item(@item1)
      expect(@auction.items.count).to eq(1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end
  end
  describe '#item_names' do
    it 'can tell the names of items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end



end