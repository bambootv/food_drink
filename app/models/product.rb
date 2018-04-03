class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, reject_if: lambda {|attr| attr[:image].blank?},
    allow_destroy: true

  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :quantity, numericality: { greater_than: -1 }

  self.per_page = 5
  scope :search, ->search{where "name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%"}
  scope :min_price, ->min_price{where "price >= ?", min_price if min_price.present?}
  scope :max_price, ->max_price{where "price <= ?", max_price if max_price.present?}
  scope :rating, ->rating{where "current_score >= ?", rating if rating.present?}
  scope :by_category, ->category_id{where category_id: category_id if category_id.present?}
  scope :favorite, ->{where "current_score >= 4"}
end
