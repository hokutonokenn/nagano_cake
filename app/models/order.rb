class Order < ApplicationRecord

  has_many :order_items
  belongs_to :customer

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_payment: 0, payment_comfirmation: 1, producting: 2, shipping_preparation: 3, shipped: 4 }

  #小計
  def total_items
    order_items.nochange_taxed_price * order_items.amount
  end

end
