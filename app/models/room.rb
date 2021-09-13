class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  #entryを通すことによりroomでusersを使えるようにする
  has_many :users, through: :entries
  has_many :notifications, dependent: :destroy

  def self.last_message
    Room.messages.order('created_at DESC').limit(1).first.message.truncate(12)
  end

  def self.last_message_post
    Room.messages.order('created_at DESC').limit(1).first
  end
end
