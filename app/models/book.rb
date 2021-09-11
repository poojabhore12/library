class Book < ApplicationRecord
    has_many :issued_books 
    has_many :users, through: :issued_books   

    validates :book_name,
            :presence => true
    validates :desc,
            :presence => true
end
