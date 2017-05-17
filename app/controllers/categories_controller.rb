class CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin!, except: [:show]
  before_action :load_parent, only: [:new, :edit]
  before_action :load_category, except: [:new, :create, :index]
  before_action :verify_category, only: [:destroy]
  before_action :load_page, only: [:index]

  def index
    @categories = Category.includes(:products).select(:id, :name).order(name: :asc)
      .paginate page: params[:page]
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to @category
    else
      load_parent
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:info] = t ".success"
      redirect_to @category
    else
      load_parent
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:info] = t ".success"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end

  def load_parent
    @parent = Category.all.map{|category| [category.name, category.id]}
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t ".none"
      redirect_to root_url
    end
  end

  def verify_category
    if @category.products.any?
      flash[:danger] = t ".can_not_delete"
      redirect_to categories_path
    end
  end
end
