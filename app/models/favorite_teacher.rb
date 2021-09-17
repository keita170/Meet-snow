class FavoriteTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_post, optional: true
end
