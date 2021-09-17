FactoryBot.define do
  factory :teacher_post do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    field { 0 }
    status { 0 }
    user
  end
end
