class FollowRequest < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'

    has_many :follower_followers, class_name: 'Follower', foreign_key: 'follower_id'
end
