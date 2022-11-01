class Item < ApplicationRecord

  has_many :order_items
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image
  belongs_to :genre

  validates :item_name, presence: true, uniqueness: true
  validates :item_body, presence: true
  validates :none_taxed_price, presence: true

  def get_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpeg")
      item_image.attach(io: File.open(file_path), filename: "default-image.jpeg", content_type: "image/jpeg")
    end
    item_image.variant(resize_to_fill: [width, height]).processed
  end

end
