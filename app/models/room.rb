class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  #entryを通すことによりroomでusersを使えるようにする
  has_many :users, through: :entries
  has_many :notifications, dependent: :destroy
end
