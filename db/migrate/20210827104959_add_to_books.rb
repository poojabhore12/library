class AddToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :is_borrowed, :boolean
    add_column :books, :is_requested, :boolean
    add_column :books, :is_deleted, :boolean
    add_column :books, :user_id, :integer
    
  end
end
