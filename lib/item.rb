class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end


  def add_bid(attendee, amount)
    if @open = true
      @bids[attendee] = amount
    end
    'Bidding is closed'
  end
  
  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open = false
  end
end