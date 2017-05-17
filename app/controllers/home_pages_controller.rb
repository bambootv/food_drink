class HomePagesController < ApplicationController
  require "will_paginate/array"
  def home
    @categories = Category.includes(:products).
      select(:id, :name, :description).compact
    @categories.each() do |f|
      unless f.products.any?
        @categories.delete(f)
      end
    end
    @categories = @categories.paginate(page: params[:page], per_page: 4)
    @products = Product.select(:id, :name, :current_score).favorite
  end

  def about
  end
end
