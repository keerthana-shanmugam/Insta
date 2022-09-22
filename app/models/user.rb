class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sender_follow_requests, class_name: 'FollowRequest', foreign_key: 'sender_id'
  has_many :recevier_follow_requests, class_name: 'FollowRequest', foreign_key: 'receiver_id'
  has_many :user_followers, class_name: 'Follower', foreign_key: 'user_id'
  has_many :posts, class_name: 'Post' , foreign_key: 'user_id'
  has_many :likes, class_name: 'Like' , foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment' , foreign_key: 'user_id'
end
