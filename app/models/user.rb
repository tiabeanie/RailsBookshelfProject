class User < ApplicationRecord
    has_many :bookshelves
    has_many :entries
    has_many :books, through: :entries

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true

    has_secure_password
end
