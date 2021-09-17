class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :student_post
  has_many :notifications, dependent: :destroy
end
