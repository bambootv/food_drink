class Category < ApplicationRecord
  has_many :products
  has_many :children, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true

  validates :description, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  self.per_page = 5
end
