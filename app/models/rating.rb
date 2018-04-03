class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  before_save :update_product_current_score

  private

  def update_product_current_score
    self.product.current_score = recaculate_current_score self.product.ratinger,
      self.product.current_score, self.score
    self.product.ratinger += 1
    self.product.save
  end

  def recaculate_current_score ratinger, current_score, new_score
    (ratinger * current_score + new_score) / (ratinger + 1)
  end
end
