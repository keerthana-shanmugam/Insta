class CreateFollowRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_requests do |t|
      t.bigint :sender_id, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.bigint :receiver_id, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.string :status

      t.timestamps
    end
    add_foreign_key :follow_requests, :users, column: :sender_id
    add_foreign_key :follow_requests, :users, column: :receiver_id
  end
end
