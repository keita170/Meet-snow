class TeacherPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_teachers, dependent: :destroy
  has_many :comment_teachers, dependent: :destroy

  def favorited_by?(user)
    favorite_teachers.where(user_id: user.id).exists?
  end

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
  enum status: { 受付中: 0, 締め切り: 1 }
end
