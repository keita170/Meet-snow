FactoryBot.define do
  factory :favorite_teacher do
    association :teacher_post
    user { teacher_post.user }
  end
end