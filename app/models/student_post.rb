class StudentPost < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
end
