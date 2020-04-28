require 'rails_helper'

RSpec.describe PlayerDecorator do
  let(:player) { create(:player).decorate }

  describe '#last_update' do
    context 'by creator' do 
      let(:condition) {"<div><div>less than a minute ago</div><small>by #{player.user.name}</small></div>"}
      it { expect(player.last_update).to match(condition) }
    end
    
    context "by new comment's user" do
      before do
        user = create(:user, name: "Hugo")
        player.comments = [create(:comment, user: user)]
      end
      let(:condition) {"<div><div>less than a minute ago</div><small>by Hugo</small></div>"}
      it { expect(player.last_update).to match(condition) }
    end
  end
  
  describe '#age' do
    let(:player) { create(:player, birthdate: Faker::Date.birthday(min_age: 20, max_age: 20)).decorate }
    it { expect(player.age).to eq(20) }
  end

  describe '#height' do
    context "only EU height" do
      let(:condition) {"<div><div>165cm</div></div>"}
      let(:player) { create(:player, height_eu: "165", height_us: nil).decorate }
      
      it { expect(player.height).to match(condition) }
    end

    context "with EU and US height" do
      let(:player) { create(:player).decorate }
      let(:condition) {"<div><div>#{player.height_eu}cm</div><small>#{player.height_us}</small></div>"}
      
      it { expect(player.height).to match(condition) }
    end
  end

  describe '#weight' do
    context "only EU weight" do
      let(:condition) {"<div><div>100kg</div></div>"}
      let(:player) { create(:player, weight_eu: "100", weight_us: nil).decorate }
      
      it { expect(player.weight).to match(condition) }
    end

    context "with EU and US weight" do
      let(:condition) {"<div><div>90kg</div><small>160lbs</small></div>"}
      let(:player) { create(:player, weight_eu: "90", weight_us: "160").decorate }
      
      it { expect(player.weight).to match(condition) }
    end
  end

  describe '#profiles_tags' do
    before do 
      player.profiles = [ create(:profile, name: "3andD"), create(:profile, name: "Slasher")]
    end
    let(:condition) {'<div><div class="tag is-primary m-xxs">3andD</div><div class="tag is-primary m-xxs">Slasher</div></div>'}

    it { expect(player.profiles_tags).to match(condition) }
  end

  describe '#salary' do 
    context 'with only salary estimation' do 
      let(:player) { create(:player, salary_real: nil, salary_estimation: "100k€ - 150k€").decorate }
      it { expect(player.salary).to eq("100k€ - 150k€") }
    end

    context 'with real salary' do 
      let(:player) { create(:player, salary_real: "135", salary_estimation: "100k€ - 150k€").decorate }
      it { expect(player.salary).to eq("135k€") }
    end
  end

  describe '#agent' do
    context 'without agent' do
      before do
        player.agent_us = nil
        player.agent_fr = nil
      end
      it { expect(player.agent).to be_nil }
    end

    context 'with only FR agent' do
      before { player.agent_fr = "Agent FR" }
      it { expect(player.agent).to eq("Agent FR") }
    end
    
    context 'with only US agent' do
      before do
        player.agent_fr = nil
        player.agent_us = "Agent US"
      end
      it { expect(player.agent).to eq("Agent US") }
    end

    context 'with both agents' do
      before do
        player.agent_fr = "Agent FR"
        player.agent_us = "Agent US"
      end
      it { expect(player.agent).to eq("Agent FR") }
    end
  end

  describe '#last_season' do
    context 'without seasons' do
      it { expect(player.last_season).to be_nil }
    end

    context 'with seasons' do
      before do
        player.seasons = [create(:season, player: player, name: "2019-2020", country: "France", team: "Le Mans")]
        player.seasons << create(:season, player: player, name: "2019-2020", country: "France", team: "Boulazac")
      end
      let(:condition) {'<div><small class="is-block">2019-2020</small><small class="is-block">France</small><div class="is-block">Boulazac</div></div>'}
      it { expect(player.last_season).to match(condition) }
    end
  end

  describe '#comments_cell' do 
    context 'without comments' do
      it { expect(player.comments).to be_nil }
    end
    
    context 'with comments' do
      before { player.comments = [create(:comment, player: player)]}
      let(:condition) {/.*<div data-controller=\"modal\"><small data-action=\"click-&gt;modal#open\">1 comment.*/}

      it { expect(player.comments).to match(condition) }
    end
  end

  describe '#available' do
    context 'when available' do
      it { expect(player.available).to eq('Dispo.') }
    end
    context 'when not available' do
      before { player.available = false }
      it { expect(player.available).to eq('Sous contrat') }
    end
  end
end