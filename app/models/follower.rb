class Follower < ApplicationRecord
    belongs_to :follower, class_name: 'FollowRequest'
    belongs_to :user, class_name: 'User'
end
