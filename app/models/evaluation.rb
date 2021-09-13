class Evaluation < ApplicationRecord
  belongs_to :user

  validates :evaluation, presence: true
  validates :user_select, presence: true
  validates :content, presence: true
  validates :comment, presence: true

  #評価ページでの検索機能
  def self.search(user_keyword)
    where(["user_select LIKE?", "%#{user_keyword}%"])
  end

  enum content: { またお願いしたい: 0, タイミングが合えば: 1, もう２度とお願いしません: 2 }
end
