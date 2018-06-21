class User < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_create_commit :user_welcome_mail

  after_destroy :verify_admin
  before_update :restrict_admin_update

  has_many :orders
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Not a valid Email Address." }

  private


  def verify_admin
    if email == 'admin@depot.com'
      raise "Cannot delete the admin."
    end
  end

  def restrict_admin_update
    if email_was == 'admin@depot.com'
      raise "Cannot update the Admin."
    end
  end

  def user_welcome_mail
    UserNotifierMailer.welcome(self).deliver
  end
end
