class RatingsController < ApplicationController

  def create
    @rating = current_user.ratings.find_or_initialize_by(product_id: params[:product_id])
    @rating.assign_attributes(rating_params)

    respond_to do |format|
      if @rating.save
        format.json { render json: { message: "Thanks for the review." }, status: 200 }
      else
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def rating_params
    params.permit(:product_id, :value)
  end
end
