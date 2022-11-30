FactoryBot.define do
  factory :article do
    name { Faker::Movie.title }
  end
end
