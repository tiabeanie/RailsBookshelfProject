class Book < ApplicationRecord
    has_many :entries
    has_many :bookshelves, through: :entries
    has_many :users, through: :entries
    belongs_to :author

    validates :title, presence: true, uniqueness: { scope: :author_id }

    scope :search, -> (query) { where("title LIKE ?", "%" + query + "%") }
    
    def author_attributes=(author_attributes)
        author_attributes.values.each do |author_attrubute|
            unless author_attrubute.blank?
                author = Author.find_or_create_by(name: author_attrubute)
                self.author = author
            end
        end
    end

    def shows_bookshelves_by_user(user_id)
        self.entries.where(user_id: user_id)
    end
end
