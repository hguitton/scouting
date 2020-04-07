FactoryBot.define do
  factory :comment do
    user{ create(:user) }
    player{ create(:player) }
    content { Faker::Lorem.paragraph }
  end
end