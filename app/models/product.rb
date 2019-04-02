class Product < ApplicationRecord
  has_many :user_products
  has_many :users, through: :user_products
  validates :name, presence: true, length: {minimum: 1, maximum: 75}
  validates :name, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum: 1, maximum: 500}
  validates :description, uniqueness: {case_sensitive: false}
  validates :price, presence: true, numericality: {greater_than: -1}
  validates :image_url, presence: true
  validates :category_id, presence: true

  def price_format
    "$%.2f" % (price / 100.00)
  end
  belongs_to :category
end
