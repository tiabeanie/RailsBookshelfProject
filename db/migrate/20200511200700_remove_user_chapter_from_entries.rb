class RemoveUserChapterFromEntries < ActiveRecord::Migration[6.0]
  def change

    remove_column :entries, :user_chapter, :integer
  end
end
