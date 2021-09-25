FactoryBot.define do
  factory :view_count do
    association :user
    association :student_post
  end
end