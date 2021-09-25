FactoryBot.define do
  factory :entry do
    user_id { FactoryBot.create(:user).id }
    room_id { FactoryBot.create(:room).id }
  end
end