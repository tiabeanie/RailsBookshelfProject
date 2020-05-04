class Book < ApplicationRecord
    has_many :entries
    has_many :bookshelves, through: :entries
    has_many :users, through: :entries
    has_many :book_genres
    has_many :genres, through: :book_genres
    belongs_to :author
end
