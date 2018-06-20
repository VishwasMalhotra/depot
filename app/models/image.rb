class Image < ApplicationRecord
  attr_accessor :picture
  belongs_to :product, optional: true

  validate :uploaded_images

@@image_count = 0
  def uploaded_images
    @@image_count += 1
    errors.add(:base, "Cannot upload more than 3 images.") if @@image_count > 3
  end

end

