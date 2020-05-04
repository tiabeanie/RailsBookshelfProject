class User < ApplicationRecord
    has_many :bookshelves
    has_many :entries
    has_many :books, through: :entries
end
