class AddToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :is_deleted, :boolean
    add_column :users, :super_admin, :boolean
  end
end
