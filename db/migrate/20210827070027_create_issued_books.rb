class CreateIssuedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :issued_books do |t|
      t.date :issue_date
      t.date :return_date
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
