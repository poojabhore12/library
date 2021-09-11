class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :desc


      t.timestamps
    end
  end
end
