class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image, null: false
      t.text :description
      t.bigint :user_id, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }

      t.timestamps
    end
    add_foreign_key :posts, :users, column: :user_id, on_delete: :cascade, on_update: :cascade
  end
end
