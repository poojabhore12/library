class AdduserIdToBbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :integer
    add_index :books, :user_id
  end
end
