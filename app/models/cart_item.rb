class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true

  # 小計を取得
  def item_price
    amount * item.price
  end

  def amount_options
    options = []
    (self.amount + 11).times do |count|
      options << [count, count]
    end
    return options
  end

  def self.price(customer)
    CartItem.where(customer_id: customer.id).inject(0){|sum, cart_item| sum + cart_item.item_price}
  end

end
