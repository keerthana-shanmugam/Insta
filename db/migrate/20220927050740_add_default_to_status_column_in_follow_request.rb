class AddDefaultToStatusColumnInFollowRequest < ActiveRecord::Migration[6.1]
  def change
    change_column :follow_requests, :status, :bool, default: false
  end
end
