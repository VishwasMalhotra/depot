class UserNotifierMailer < ApplicationMailer
    default from: 'Vishwas Malhotra <depot_app@depot.co.in>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: user.email, subject: "Welcome to Depot App!"
  end

  def order_information(user)
    @user = user

    mail to: user.email, subject: "Total Orders Record"
  end
end
