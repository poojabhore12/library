class AddToBooksReturn < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :return, :boolean
  end
end
