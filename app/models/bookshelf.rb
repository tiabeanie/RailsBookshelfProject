class Bookshelf < ApplicationRecord
    belongs_to :user
    has_many :entries
    has_many :books, through: :entries
end
