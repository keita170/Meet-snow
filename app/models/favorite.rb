class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :student_post, optional: true
end
