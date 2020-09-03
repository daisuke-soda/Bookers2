class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'


  validates :user_id, presence : true
  validates :follow_id, presence : true
end
