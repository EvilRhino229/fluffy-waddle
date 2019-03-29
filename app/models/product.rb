class Product < ApplicationRecord
  validates :name, length: {minimum: 1, maximum: 20}
  validates :description, length: {minimum: 1, maximum: 500}
  validates :price, numericality: {greater_than: 0}
  validates :image_url, presence: true
  validates :category_id, presence: true

  def price_format
    "$%.2f" % (price / 100.00)
  end
  belongs_to :category
end
