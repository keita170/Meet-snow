FactoryBot.define do
  factory :teacher_view_count do
    association :user
    association :teacher_post
  end
end