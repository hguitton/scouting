require 'rails_helper'

RSpec.describe Priority, type: :model do
  it { is_expected.to have_many(:players) }
  it { should validate_presence_of(:name) }

  describe '#default_scope' do
    let!(:priority1){ create(:priority)}
    let!(:priority2){ create(:priority, active: false)}

    it "returns only a Priority" do
      expect(Priority.count).to be(1)
    end

    it "doesn't return the unactive Priority" do
      expect(Priority.all).to_not include(priority2)
    end
  end
end
