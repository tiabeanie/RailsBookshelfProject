class BookGenre < ApplicationRecord
    belongs_to :show
    belongs_to :genre
end
