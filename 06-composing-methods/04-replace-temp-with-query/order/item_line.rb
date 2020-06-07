class Order
  class ItemLine
    DISCOUNTS = [
      { price_range: (1000..1999), rate: 0.95 },
      { price_range: (1..999),     rate: 0.98 }
    ]

    def initialize(quantity, item_price)
      @quantity, @item_price = quantity, item_price
    end

    def price
      @price ||= base_price * discount_factor
    end

    def base_price
      @base_price ||= @quantity * @item_price
    end

    def discount_factor
      @discount_factor ||= DISCOUNTS.find { |price_range: , rate:| price_range.include? base_price }[:rate]
    end
  end
end
