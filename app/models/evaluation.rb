class Evaluation < ApplicationRecord
  belongs_to :user

  #評価ページでの検索機能
  def self.search(user_keyword)
    where(["user_select LIKE?", "%#{user_keyword}%"])
  end

  enum content: { もう一度お願いしたい: 0, タイミングが合えば: 1, もう２度とお願いしません: 2 }
end
