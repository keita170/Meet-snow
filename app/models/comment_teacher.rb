class CommentTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_post
end
