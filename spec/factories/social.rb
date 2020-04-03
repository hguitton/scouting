FactoryBot.define do
  factory :social do
    link { Faker::Internet.url }
  end
end