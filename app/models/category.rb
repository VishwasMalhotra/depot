class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_category, class_name: "Category", optional: true

  has_many :products, dependent: :restrict_with_error
  has_many :sub_products, through: :subcategories, source: :products, dependent: :restrict_with_error

  validates :title, presence: true, uniqueness: {scope: :parent_id, allow_blank: true}
end
