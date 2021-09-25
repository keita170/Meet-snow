FactoryBot.define do
  factory :favorite do
    association :student_post
    user { student_post.user }
  end
end