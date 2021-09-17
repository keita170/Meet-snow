class CommentTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_post

  has_many :notifications, dependent: :destroy
end
