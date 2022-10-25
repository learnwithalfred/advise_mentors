class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :likes_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0
      t.string :author_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
