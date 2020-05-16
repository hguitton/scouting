FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    birthdate  { Faker::Date.birthday(min_age: 18, max_age: 35) }
    status_id { create(:status).id }
    nationality { Faker::Address.country }
    agent_fr { Faker::Name.name }
    agent_us { Faker::Name.name }
    position_id { create(:position).id }
    height_us { Faker::Demographic.height(unit: :imperial) }
    height_eu { Faker::Demographic.height }
    weight_us { Faker::Number.between(from: 100, to: 300) }
    weight_eu { Faker::Number.between(from: 70, to: 150) }
    salary_estimation { ['< 50k€', '50k€ - 99k€', '100k€ - 149k€', '150k€ - 199k€', '200k€ - 249k€', '250k€+ '].sample }
    salary_real { Faker::Number.between(from: 50, to: 300) }
    available { "Available" }
    program { Faker::Educator.campus }
    level_id { create(:level).id }
    updated_by_user_id { create(:user).id }
    priority_id { create(:priority).id }
  end
end