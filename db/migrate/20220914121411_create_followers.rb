class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.bigint :follower_id, null: false, foreign_key: { to_table: :follow_requests, on_delete: :cascade, on_update: :cascade }
      t.bigint :user_id, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }

      t.timestamps
    end
    add_foreign_key :followers, :follow_requests, column: :follower_id
    add_foreign_key :followers, :users, column: :user_id
  end
end
