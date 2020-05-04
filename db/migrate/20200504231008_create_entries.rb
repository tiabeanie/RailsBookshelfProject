class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :bookshelf_id
      t.integer :book_id
      t.integer :user_id
      t.text :user_notes
      t.integer :user_chapter

      t.timestamps
    end
  end
end
