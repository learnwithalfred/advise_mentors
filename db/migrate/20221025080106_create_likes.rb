class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id, null: false, index: true, foreign_key: true
      t.references :post, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
