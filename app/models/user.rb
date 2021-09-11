class User < ApplicationRecord    
    has_many :issued_book
    has_many :books, through: :issued_books
    
    
    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be vaild email address"}
end