class ChangeRoleInUsers < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :users, :role, :integer, default: 0
      end
      dir.down do
        change_column :users, :role, :string, default: :user
      end
    end
  end
end
