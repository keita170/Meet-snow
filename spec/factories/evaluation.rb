FactoryBot.define do
  factory :evaluation do
    evaluation {4.0}
    comment { Faker::Lorem.characters(number: 20) }
    content {"またお願いしたい"}
    user
  end
end