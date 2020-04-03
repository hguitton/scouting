FactoryBot.define do
  factory :comment do
    user{ create(:user) }
    content { Faker::Lorem.paragraph }
  end
end