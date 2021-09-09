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

  #DM機能関連
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

  #フォローフォロワー機能関連
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :followed, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy
  has_many :followed_user, through: :followed, source: :follower
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  #フォロー機能作成時において、使えるメソッドを追加
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end
  
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end


  #イメージメソッドの追加
  has_one_attached :image

  #画像のバリデーション
  # validate :image_type

   # is_valid==falseの場合、ログインさせない
  def active_for_authentication?
    super && (is_valid?)
  end

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/png'))
      image.purge # Rails6では、この1行は必要ない
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
