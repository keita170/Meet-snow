class ViewCount < ApplicationRecord
  belongs_to :user
  belongs_to :student_post
end
