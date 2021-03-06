class Notification < ApplicationRecord
  belongs_to :student_post, optional: true
  belongs_to :teacher_post, optional: true
  belongs_to :comment, optional: true
  belongs_to :comment_teacher, optional: true

  belongs_to :room, optional: true
  belongs_to :message, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
