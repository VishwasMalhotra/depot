class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_category, class_name: "Category", optional: true

  has_many :products
  has_many :sub_products, through: :subcategories, source: :products

  validates :title, presence: true, uniqueness: {scope: :parent_id}, allow_nil: true
end
