class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.integer :current_chapter
      t.integer :created_by

      t.timestamps
    end
  end
end
