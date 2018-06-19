class Image < ApplicationRecord
  attr_accessor :picture_1
  attr_accessor :picture_2
attr_accessor :picture_3
  belongs_to :user, optional: true
end
