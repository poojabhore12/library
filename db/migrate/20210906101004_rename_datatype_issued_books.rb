class RenameDatatypeIssuedBooks < ActiveRecord::Migration[5.2]
  def change
    change_column(:issued_books, :issue_date, :datetime) 
    change_column(:issued_books, :return_date, :datetime)
  end
end
