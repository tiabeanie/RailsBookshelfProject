class Entry < ApplicationRecord
    belongs_to :bookshelf
    belongs_to :show
    belongs_to :user
end
