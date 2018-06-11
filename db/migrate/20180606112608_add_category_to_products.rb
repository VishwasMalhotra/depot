class AddCategoryToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :category
  end
end
