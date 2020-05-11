class RemoveCurrentChapterFromBooks < ActiveRecord::Migration[6.0]
  def change

    remove_column :books, :current_chapter, :integer
  end
end
