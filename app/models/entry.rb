class Entry < ApplicationRecord
    belongs_to :book
    belongs_to :show
    belongs_to :user

    validates :bookshelf_id, uniqueness: { scope: :show_id }, :on => :create
end
