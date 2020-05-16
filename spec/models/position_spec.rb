require 'rails_helper'

RSpec.describe Position, type: :model do
  it { is_expected.to have_many(:players) }
  it { should validate_presence_of(:name) }

  describe '#default_scope' do
    let!(:pos1){ create(:position)}
    let!(:pos2){ create(:position, active: false)}

    it "returns only a position" do
      expect(Position.count).to be(1)
    end

    it "doesn't return the unactive position" do
      expect(Position.all).to_not include(pos2)
    end
  end
end
