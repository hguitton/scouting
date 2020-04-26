FactoryBot.define do
  factory :priority do
    name { ["Short list", "A suivre", "Trop cher", "No way"].sample }
  end
end