FactoryBot.define do
  factory :comment do
    association :student_post
    user { student_post.user }
    comment { Faker::Lorem.word }
  end
end