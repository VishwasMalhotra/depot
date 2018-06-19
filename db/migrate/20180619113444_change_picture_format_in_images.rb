class ChangePictureFormatInImages < ActiveRecord::Migration[5.1]
  def change
    change_column :images, :picture, :string
    rename_column :images, :picture, :name
  end
end
