require 'carrierwave/orm/activerecord'
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, class_name: 'User'
  has_many :likes, class_name: 'Like' , foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment' , foreign_key: 'post_id'
end
