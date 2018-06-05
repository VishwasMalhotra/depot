
1.
rails generate migration AddDetailsToProducts enabled:boolean discount_price:decimal permalink:string

class AddDetailsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :enabled, :boolean
    add_column :products, :discount_price, :decimal
    add_column :products, :permalink, :string
  end
end
#Add index to enabled, permalink


2.
rails generate migration ChangeEnabledDefaultValue

class ChangeEnabledDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :enabled, from:nil ,to:false
  end
end

3.
rails generate migration AddEmailToUsers email:string

class AddEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
  end
end

4.
rails generate migration AddLineItemsCountToCart line_items_count:integer

class AddLineItemsCountToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :line_items_count, :integer, null: false, default: 0
  end
end

5.
  <div class="field">
    <%= form.label :discount_price %>
    <%= form.text_field :discount_price, id: :product_discount_price %>
  </div>

  <div class="field">
    <%= form.label :permalink %>
    <%= form.text_field :permalink, id: :product_permalink %>
  </div>

  <div class="field">
    <%= form.label :enabled %>
    <%= form.check_box :enabled, id: :enabled %>
  </div>
#Remove id

6.
  <div class="field">
    <%= form.label :email %>
    <%= form.text_field :email, id: :user_email %>
  </div>
#Remove id

5&6 : Added the respective field in the params to be passed.

7.
rails generate migration ChangeColumnOfProducts

class ChangeColumnOfProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :address, :string
  end
end
#normal up and down and reversible up and down




----------Changes---------------

1. To add the index
rails generate migration AddDetailingToProducts enabled:boolean:index discount_price:decimal permalink:string:index
or
Manually add this,
add_index :products, :enabled
add_index :products, :permalink

2.
class ChangeColumnOfProducts < ActiveRecord::Migration[5.1]
  def change
     reversible do |dir|
        dir.up do
          change_column :orders, :address, :string
        end
        dir.down do
          change_column :orders, :address, :text
        end
     end
  end
end




