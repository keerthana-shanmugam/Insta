class FollowRequest < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'

    has_many :follower_followers, class_name: 'Follower', foreign_key: 'follower_id'

    validates :sender_id, uniqueness: { scope: :receiver_id }
    validates :receiver_id, uniqueness: { scope: :sender_id }
end
