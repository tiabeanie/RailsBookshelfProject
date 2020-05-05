class Bookshelf < ApplicationRecord
    belongs_to :user
    has_many :entries
    has_many :books, through: :entries

    validates :name, presence: true

    before_destroy :destroy_entries

    private
    def destroy_entries
        self.entries.each do |entry|
            entry.destroy
        end
    end
end
