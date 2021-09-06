class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :student_posts, dependent: :destroy
  has_many :teacher_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_teachers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_teachers, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :followed, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy
  has_many :followed_user, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end



  #メソッドの追加
  has_one_attached :image

  #画像のバリデーション
  validate :image_type

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/png'))
      image.purge # Rails6では、この1行は必要ない
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
