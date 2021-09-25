FactoryBot.define do
  factory :comment_teacher do
    association :teacher_post
    user { teacher_post.user }
    comment { Faker::Lorem.word }
  end
end