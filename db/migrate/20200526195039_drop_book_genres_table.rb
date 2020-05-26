class DropBookGenresTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :book_genres
  end
end
