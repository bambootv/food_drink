class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include AjaxHelper
  include LoadPageHelper
  include OrderHelper

  private

  def verify_admin!
    unless current_user.admin?
      flash[:danger] = t "not_admin"
      redirect_to root_url
    end
  end
end
