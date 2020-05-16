require 'rails_helper'

RSpec.describe Season, type: :model do
  it { is_expected.to belong_to(:player) }
  it { should validate_presence_of(:team) }
end
