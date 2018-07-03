namespace :user do
  task update_user_for_total_orders: :environment do
    User.all.each do |user|
      user.orders_information_mail
    end
  end
end
