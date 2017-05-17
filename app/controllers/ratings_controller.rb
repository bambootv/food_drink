class RatingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]
  before_action :validate_user?, only: [:update]

  def create
    @rating = current_user.ratings.build rating_params
    if @rating.save
      render_success @rating
    else
      render_error @rating
    end
  end

  def update
    if @rating.update_attributes rating_params
      render_success @rating
    else
      render_error @rating
    end
  end

  private

  def rating_params
    params.require(:rating).permit :product_id, :score
  end

  def validate_user?
    @rating = Rating.find_by id: params["id"]
    unless @rating.user.is_user? @current_user
      render_text_error t(".not_correct_user")
    end
  end
end
