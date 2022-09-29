class RemoveCloumnStatusInFollowRequest < ActiveRecord::Migration[6.1]
  def change
    remove_column :follow_requests, :status , :bool
  end
end
