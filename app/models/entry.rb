class Entry < ApplicationRecord
    belongs_to :bookshelf
    belongs_to :book
    belongs_to :user

    validates :bookshelf_id, uniqueness: { scope: :book_id }, :on => :create
end
