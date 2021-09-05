class TeacherPost < ApplicationRecord

  belongs_to :user

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
end
