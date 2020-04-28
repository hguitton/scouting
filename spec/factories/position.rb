FactoryBot.define do
  factory :position do
    name { ['Point Guard', 'Guard', 'Shooting Guard', 'Small Forward', 'Forward', 'Power Forward', 'Center'].sample }
    short { ['PG', 'G', 'SG', 'SF', 'F', 'PF', 'C'].sample }
  end
end