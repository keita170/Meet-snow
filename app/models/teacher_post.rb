class TeacherPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_teachers, dependent: :destroy
  has_many :comment_teachers, dependent: :destroy
  has_many :commented_users, through: :comment_teachers, source: :user
  has_many :teacher_view_counts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :field, presence: true

  def favorited_by?(user)
    favorite_teachers.where(user_id: user.id).exists?
  end

  #検索機能
  def self.search_teacher(key_word)
    where(["title LIKE? OR body LIKE?", "%#{key_word}%", "%#{key_word}%"])
  end

  #ランキング機能
  def self.one_week
    TeacherPost.joins(:favorite_teachers).where(favorite_teachers: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day}).group(:teacher_post_id).order("count(teacher_post_id) desc").limit(3)
  end
  def self.one_week_comment
    TeacherPost.joins(:comment_teachers).where(comment_teachers: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day}).group(:teacher_post_id).order("count(teacher_post_id) desc").limit(3)
  end
  def self.one_week_post
    TeacherPost.joins(:teacher_view_counts).where(teacher_view_counts: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day}).group(:teacher_post_id).order("count(teacher_post_id) desc").limit(3)
  end

  #いいね通知機能
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

  #コメント通知機能
  def create_notification_comment!(current_user, comment_teacher_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(teacher_post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_teacher_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_teacher_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_teacher_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      teacher_post_id: id,
      comment_teacher_id: comment_teacher_id,
      visited_id: visited_id,
      action: 'comment_teacher'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
  enum status: { 受付中: 0, 締め切り: 1 }
end
