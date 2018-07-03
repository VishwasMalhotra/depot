class StoreController < ApplicationController
skip_before_action :authenticate
include CurrentCart
before_action :set_cart
  def index
    @products = Product.enabled
  end
end
