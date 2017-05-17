module AjaxHelper

  def render_success rating
    render json: {
      new_score: rating.product.current_score.round(2),
      rating_id: rating.id
    }, status: :created
  end

  def response_not_login
    render json: {
      not_login: true,
      login_url: login_url
    }, status: :created
  end

  def response_not_enough_quantity product
    render json: {
        quantity: product[:quantity],
        product_name: product[:product_name]
    }, status: :created
  end

  def render_error rating
    render json: {
      reason:  rating.errors
    }, status: :unprocessable_entity
  end

  def render_text_error reason
    render json: {
      reason: reason
    }, status: :unprocessable_entity
  end

  def render_success_home_page
    render json: {
    }, status: :created
  end

  def render_success_order order_id
    render json: {
      order_id: order_id
    }, status: :created
  end

  def delete_comment_success comment_id
    render json: {
      comment_id: comment_id
    }, status: :created
  end
end
