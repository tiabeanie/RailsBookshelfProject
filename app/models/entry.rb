class Entry < ApplicationRecord
    belongs_to :bookshelf
    belongs_to :show
    belongs_to :user

    validates :user_chapter, presence: true, numericality: { greater_than: 0 }
    validates :bookshelf_id, uniqueness: { scope: :show_id }, :on => :create
    validate user_chapter_vs_total_chapters

    def user_chapter_vs_total_chapters
        if user_chapter.present? && user_chapter > book.user_chapter_vs_total_chapters
            errors.add(:user_chapter, "there aren't that many chapters")
        end
    end
end
