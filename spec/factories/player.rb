FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    birthdate  { Faker::Date.birthday(min_age: 18, max_age: 35) }
    status { ['JNFL', 'Bosman', 'Cotonou', 'JFL'].sample }
    nationality { Faker::Address.country }
    agent_fr { Faker::Name.name }
    agent_us { Faker::Name.name }
    position { Faker::Sports::Basketball.position }
    height_us { Faker::Demographic.height(unit: :imperial) }
    height_eu { Faker::Demographic.height }
    weight_us { Faker::Number.between(from: 100, to: 300) }
    weight_eu { Faker::Number.between(from: 70, to: 150) }
    salary_estimation { ['< 50k€', '50k€ - 100k€', '100k€ - 150k€', '150k€ - 200k€', '200k€ - 250k€', '250k€+ '].sample }
    salary_real { Faker::Number.between(from: 50, to: 300) }
    available { true }
    program { Faker::Educator.campus }
    level_id { create(:level).id }
    priority {["Short list", "A suivre", "Trop cher", "No way"].sample }
  end
end