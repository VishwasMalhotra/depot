class Admin::CategoriesController < Admin::BaseController
  def index
    @category = Category.includes(:products, subcategories: :products)
  end

  def books
    @category = Category.find_by_id(params[:id])
  end
end
