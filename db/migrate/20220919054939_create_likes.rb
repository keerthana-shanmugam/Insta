class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.bigint :user_id, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.bigint :post_id, null: false, foreign_key: { to_table: :posts, on_delete: :cascade, on_update: :cascade }

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key :likes, :posts, column: :post_id, on_delete: :cascade, on_update: :cascade
  end
end
