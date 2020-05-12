require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:level) }
  it { is_expected.to belong_to(:status) }
  it { is_expected.to belong_to(:priority) }
  it { is_expected.to belong_to(:position) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:seasons) }
  it { is_expected.to have_many(:socials) }
  it { is_expected.to have_many(:comments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:nationality) }

  describe '#with_height_between' do
    subject { create(:player, height_eu: 200) }

    it { expect(Player.with_height_between(180,210)).to include(subject) }
    it { expect(Player.with_height_between(205,215)).not_to include(subject) }
  end

  describe '#with_weight_between' do
    subject { create(:player, weight_eu: 100) }
    
    it { expect(Player.with_weight_between(80,110)).to include(subject) }
    it { expect(Player.with_weight_between(60,90)).not_to include(subject) }
  end
  
  describe '#with_position' do
    let!(:pos){ create(:position, id: 1) }
    subject { create(:player, position_id: pos.id) }

    it { expect(Player.with_position([1,2,3])).to include(subject) }
    it { expect(Player.with_position([2,3])).not_to include(subject) }
    it { expect(Player.with_position([])).not_to include(subject) }
  end

  describe '#with_status' do
    let!(:status){ create(:status, id: 1) }
    subject { create(:player, status_id: status.id) }

    it { expect(Player.with_status([1,2,3])).to include(subject) }
    it { expect(Player.with_status([2,3])).not_to include(subject) }
    it { expect(Player.with_status([])).not_to include(subject) }
  end

  describe '#with_priority' do
    let!(:priority){ create(:priority, id: 1) }
    subject { create(:player, priority_id: priority.id) }

    it { expect(Player.with_priority([1,2,3])).to include(subject) }
    it { expect(Player.with_priority([2,3])).not_to include(subject) }
    it { expect(Player.with_priority([])).not_to include(subject) }
  end

  describe '#with_available' do
    subject { create(:player, available: "Available") }

    it { expect(Player.with_available(["Available", "Unknown"])).to include(subject) }
    it { expect(Player.with_available(["Unknown"])).not_to include(subject) }
    it { expect(Player.with_available([])).not_to include(subject) }
  end

  # describe '#with_age_between' do
  #   let!(:date) { 20.years.ago.to_time }
  #   subject { create(:player, birthdate_timestamp: date) }
  #   it { expect(Player.with_age_between(18,35)).to include(subject) }
  #   it { expect(Player.with_age_between(22,35)).not_to include(subject) }
  # end

  describe '#with_salary_between' do
    context 'without real salary' do 
      subject { create(:player, salary_estimation: '50k€ - 99k€', salary_real: 0) }
      it { expect(Player.with_salary_between(60,90)).to include(subject) }
      it { expect(Player.with_salary_between(110,150)).not_to include(subject) }
    end

    context 'with real salary' do
      subject { create(:player, salary_estimation: '50k€ - 99k€', salary_real: 110) }
      it { expect(Player.with_salary_between(60,90)).not_to include(subject) }
      it { expect(Player.with_salary_between(110,150)).to include(subject) }
    end
  end

  describe '#with_profiles' do
    let!(:profile1){ create(:profile, id: 1) }
    let!(:profile2){ create(:profile, id: 2) }
    let!(:profile3){ create(:profile, id: 3) }
    subject { create(:player) }
    before do 
      subject.profiles << profile1
      subject.profiles << profile2
    end
    it { expect(Player.with_profiles([1])).to include(subject) }
    it { expect(Player.with_profiles([1,2])).to include(subject) }
    it { expect(Player.with_profiles([1,2,3])).not_to include(subject) }
  end
end
