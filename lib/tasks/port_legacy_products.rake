namespace :port_legacy_products do
  task :port_legacy_products => :environment do
    Product.where(:category_id => nil).update_all(:category_id => Category.first.id)
    Category.reset_counters(Category.first.id, :products)
  end
end
