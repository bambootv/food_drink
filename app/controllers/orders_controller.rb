class OrdersController < ApplicationController
  before_action :cart_data, only:[:show]

  def index
    @orders = Order.find_by_user_id current_user.id
  end

  def create
    unless current_user
      store_location
      response_not_login
    else
      cart_data
      @order = Order.new(user_id: current_user.id, status: 1)
      @cart.each do |product_id, quantity|
        order = @order.line_items.includes(:products).
          new(product_id: product_id, quantity: quantity)
        if order.product.quantity < quantity.to_f
          @disparity = {}
          @disparity[:product_name] = order.product.name
          @disparity[:quantity] = order.product.quantity
        end
      end

      if @disparity
        response_not_enough_quantity @disparity
      else
        @order.update_attributes total_cost: total_cost
        if @order.save
          cookies.delete :cart
          flash[:success] = t "thank_payed"
          render_success_order @order.id
        else
          render_text_error t("error")
        end
      end
    end
  end

  def show
    if params[:id]
      @order = Order.includes(:line_items).find_by id: params[:id]
    else
      @order = Order.new
      @cart.each do |product_id, quantity|
        @order.line_items.includes(:products)
          .new(product_id: product_id, quantity: quantity)
      end
    end
  end

end
