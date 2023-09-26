require './spec/spec_helper'

RSpec.describe Auction do
  before(:each) do 
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
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

  describe '#unpopular_items' do
    it 'shows any item with no bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end

  describe "#potential_revenue" do 
    it 'tells you how much money can be made' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe '#bidders' do
    it 'tells who has bid on something' do
      expect(@auction.bidders).to eq([])
      @auction.add_item(@item1)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @item1.add_bid(@attendee1, 22)
      expect(@auction.bidders).to eq(['Megan'])
      @item4.add_bid(@attendee3, 50)
      expect(@auction.bidders).to eq(['Megan', 'Mike'])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
      @item3.add_bid(@attendee2, 15)
    end
    it 'will not duplicate names' do
      @auction.add_item(@item1)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item2.add_bid(@attendee2, 15)
      expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end
  end

  describe '#bidder_info' do 
    it 'tells you all of their info' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidder_info.keys).to eq([@attendee2, @attendee1, @attendee3])
    end
  end



end