class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\.(png|jpg|gif)$/
      record.errors[attribute] << "is not a proper URL format."
    end
  end
end

class MyValidator < ActiveModel::Validator
  def validate(record)
      record.errors[:price] << 'Price should be greater than the Discount Price.' if record.price && record.discount_price && record.price < record.discount_price
  end
end

class Product < ApplicationRecord
  scope :enabled, -> { where(enabled: true) }
  has_many :line_items, dependent: :restrict_with_error
  belongs_to :category, counter_cache: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :carts, through: :line_items
  has_many :ratings

  before_destroy :ensure_not_referenced_by_any_line_item
  before_save :discount_equal_to_price
  before_validation :assign_default_title, on: :create, unless: :title?

  validates_with MyValidator
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}, allow_nil: true
  validates :permalink, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :description_words, length: {
    minimum: 5,
    maximum: 10,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates :image_url, url:true

  def rating_average
    ratings.average(:rating)
  end

private
  def description_words
    description.split(' ')
  end

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  def assign_default_title
    self.title = 'abc'
  end

  def discount_equal_to_price
    self.discount_price ||= price
  end
end
