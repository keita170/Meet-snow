class StudentPost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user

  has_many :notifications, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  validates :field, presence: true

  # いいね機能実装にて使用
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # キーワード検索用
  def self.search(keyword)
    where(["body LIKE? OR title LIKE?", "%#{keyword}%", "%#{keyword}%"]).order('created_at DESC')
  end

  # ランクキング機能で使用する
  def self.one_week
    StudentPost.joins(:favorites).where(favorites: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day }).group(:student_post_id).order("count(student_post_id) desc").limit(3)
  end

  def self.one_week_comment
    StudentPost.joins(:comments).where(comments: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day }).group(:student_post_id).order("count(student_post_id) desc").limit(3)
  end

  def self.one_week_post
    StudentPost.joins(:view_counts).where(view_counts: { created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day }).group(:student_post_id).order("count(student_post_id) desc").limit(3)
  end

  # いいねでの通知機能
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and student_post_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        student_post_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメントでの通知機能
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(student_post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      student_post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  scope :status, -> { order(status: :desc) }

  enum field: { フリースタイル: 0, グラトリ: 1, カービング: 2, その他: 3 }
  enum status: { 受付中: 0, 締め切り: 1 }
end
