class SearchesController < ApplicationController
  def index
    @products ||= Product.search(params[:search]).min_price(params[:min_price])
      .max_price(params[:max_price]).by_category(params[:category_id])
      .rating(params[:rating])
  end
end
