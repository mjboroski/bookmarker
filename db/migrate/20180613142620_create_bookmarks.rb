class CreateBookmarks < ActiveRecord::Migration
  def up
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.string :directory
      t.integer :user_id
    end
  end

  def down
    drop_table :bookmarks
  end
end
