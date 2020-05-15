require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:player) }
  it { should validate_presence_of(:content) }
end
