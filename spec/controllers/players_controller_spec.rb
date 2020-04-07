require 'rails_helper'

RSpec.describe PlayersController, type: [:controller, :request] do
  include Devise::Test::IntegrationHelpers
  render_views

  describe "#index" do
    let!(:players) { FactoryBot.create_list(:player, 5) }
    
    before :each do
      user = FactoryBot.create(:user)
      sign_in user
    end

    context "request JSON" do
      before do
        get players_path, as: :json
      end
      
      it 'returns code 200' do
        expect(response).to have_http_status(:success)
      end

      it 'returns JSON format' do
        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
      end

      it 'returns 5 elements' do
        expect(JSON.parse(response.body).size).to eq(5)
      end

      it 'contains content' do 
        expect(response.body).to include(players.first.name)
      end
    end

    context "request HTML" do
      before { get players_path } 
      
      it 'returns code 200' do
        expect(response).to have_http_status(:success)
      end

      it 'contains content' do 
        expect(response.body).to include(players.first.name)
      end
    end
  end

  describe "#create" do
    before :each do
      user = FactoryBot.create(:user)
      sign_in user
    end

    before do
      post players_path, params: { player: player }
    end 

    context 'with wrong datas' do
      let(:player) { Player.new.attributes }
  
      it 'should not create the record' do
        expect(response.body).to include("can&#39;t be blank")
        expect(response).to have_http_status(:success)
        expect { post players_path, params: { player: player } }.not_to change { Player.all.count }
      end
    end

    context 'with correct datas' do
      let(:player) { FactoryBot.attributes_for(:player) }

      it 'should  create the record' do
        expect { post players_path, params: { player: player } }.to change { Player.all.count }.by(1)
      end
    end
  end
end 