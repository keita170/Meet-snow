class StudentPost < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  def self.search(keyword)
    where(["title LIKE? OR body LIKE?", "%#{keyword}%", "%#{keyword}%"])
  end

  # def self.search(keyword)
  #   student_post = StudentPost.where(["title like? OR body like? OR field like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  # end

  # def self.search(key_word)
  #   if key_word == ''
  #     student_post = StudentPost.all
  #   else
  #     student_post = StudentPost.where(['title LIKE? OR body LIKE? OR field LIKE?', "%#{key_word}%", "%#{key_word}%", "%#{key_word}%"])
  #   end
  # end

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
  enum status: { 受付中: 0, 締め切り: 1 }
end
