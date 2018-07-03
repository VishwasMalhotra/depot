class OrderNotifierMailer < ApplicationMailer
  default from: 'Vishwas Malhotra <depot_app@depot.co.in>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @order = order

    image_attachment(@order)

    I18n.with_locale(order.user.language) do
      mail({
        :subject => "Depot App Test Email Order received.",
        :to      => order.email
      })
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Depot App Test Email Shipped.'
  end

  def image_attachment(order)
    order.line_items.each do |line_item|
      line_item.product.images.each_with_index do |image, index|
        if index.zero?
          attachments.inline[image.name] = File.read(Rails.root.join('app', 'assets', 'images', image.id.to_s.concat(".jpg")))
        else
          attachments[image.name] = File.read(Rails.root.join('app', 'assets', 'images', image.id.to_s.concat(".jpg")))
        end
      end
    end
  end
end
