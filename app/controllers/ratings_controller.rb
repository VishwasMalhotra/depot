class RatingsController < ApplicationController
  def create
     @rating = current_user.ratings.find_by(product_id: params[:product_id])
    if @rating
       @rating.rating = params[:rating]
     else
      @rating = Rating.new(rating_params)
      @rating.user = current_user
    end
    @rating.save
  end

  private
  def rating_params
    params.permit(:product_id, :rating)
  end
end
