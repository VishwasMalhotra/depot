class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.includes(:products, subcategories: :products)
  end
end
