class Image < ApplicationRecord
  attr_accessor :picture
  belongs_to :product, optional: true

  validate :uploaded_images

  def uploaded_images
    errors.add(:base, "Cannot upload more than 3 images.") if product.images.count > 3
  end

end

