class RemoveisAdminFromusers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_admin
    remove_column :users, :super_admin 
  end
end
