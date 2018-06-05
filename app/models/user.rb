class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_create_commit :user_welcome_mail
  # after_destroy :ensure_an_admin_remains
  after_destroy :verify_admin
  before_update :restrict_admin_update

  has_many :orders
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Not a valid Email Address." }

  private
    # def ensure_an_admin_remains
    #   if User.count.zero?
    #     raise
    #   end
    #     raise ActiveRecord::Rollback
    # end

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
