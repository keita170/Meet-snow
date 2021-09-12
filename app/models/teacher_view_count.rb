class TeacherViewCount < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_post
end
