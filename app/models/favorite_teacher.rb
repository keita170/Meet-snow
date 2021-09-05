class FavoriteTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_post, required: false
end
