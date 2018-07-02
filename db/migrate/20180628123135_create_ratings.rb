class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :product
      t.references :user
      t.decimal :rating, precision: 2, scale: 1

      t.timestamps
    end
  end
end
