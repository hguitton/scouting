FactoryBot.define do
  factory :status do
    name { ['JNFL', 'Bosman', 'Cotonou', 'JFL'].sample }
  end
end