class Evaluation < ApplicationRecord
  belongs_to :user
  
  def self.search(user_keyword)
    where(["user_select LIKE?", "%#{user_keyword}%"])
  end

  enum content: { もう一度お願いしたい: 0, タイミングが合えば: 1, もう２度と受けません: 2 }
end
