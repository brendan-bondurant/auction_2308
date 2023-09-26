class Auction
  attr_reader :items
  def initialize
    @items = []
    @bidders = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.map do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    no_bids = @items.find_all do |item|
      item.bids.empty?
    end
    no_bids
  end

  def bidders
    @items.each do |item|
      item.bids.keys.each do |person|
        @bidders << person.name
      end
    end
    @bidders = @bidders.uniq.sort.flatten
  end

  def potential_revenue
    potential_revenue = 0
    @items.each do |item|
      if item.bids.size > 0
        potential_revenue += item.bids.values.max
      end
    end
    potential_revenue
  end

  def bidder_info
    bidder_info = Hash.new
    bid_on = []
    @items.each do |item|
      item.bids.each do |person|
        if item.bids.keys.include?(person.first)
          bid_on << item
        end
        bidder_info[person.first] = {:value => person.first.budget.delete('$').to_i, :items => bid_on.uniq}
      end
    end
    bidder_info
  end
end