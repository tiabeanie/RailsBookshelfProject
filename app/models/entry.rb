class Entry < ApplicationRecord
    belongs_to :bookshelf
    belongs_to :show
    belongs_to :user

    validates :bookshelf_id, uniqueness: { scope: :show_id }, :on => :create
end
