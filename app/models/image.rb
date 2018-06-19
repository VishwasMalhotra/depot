class Image < ApplicationRecord
  attr_accessor :picture
  belongs_to :products, optional: true
end
