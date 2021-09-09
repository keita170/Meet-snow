class TeacherPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_teachers, dependent: :destroy
  has_many :comment_teachers, dependent: :destroy

  has_many :notifications, dependent: :destroy

  def favorited_by?(user)
    favorite_teachers.where(user_id: user.id).exists?
  end

  def self.search_teacher(key_word)
    where(["title LIKE? OR body LIKE?", "%#{key_word}%", "%#{key_word}%"])
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and teacher_post_id = ? and action = ? ", current_user.id, user_id, id, 'favorite_teacher'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        teacher_post_id: id,
        visited_id: user_id,
        action: 'favorite_teacher'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
  enum status: { 受付中: 0, 締め切り: 1 }
end
