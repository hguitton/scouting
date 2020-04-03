FactoryBot.define do
  factory :season do
    name {  }
    team { Faker::Sports::Basketball.team }
    country { Faker::Address.country }
    min { Faker::Number.between(from: 5, to: 40) }
    points { Faker::Number.between(from: 3, to: 30) }
    trb { Faker::Number.between(from: 3, to: 12) }
    ast { Faker::Number.between(from: 3, to: 12) }
  end
end