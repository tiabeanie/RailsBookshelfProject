class DropGenresTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :genres
  end
end
