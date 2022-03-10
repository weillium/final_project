require 'rails_helper'

RSpec.describe "scores#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/scores", params: params
  end

  describe 'basic fetch' do
    let!(:score1) { create(:score) }
    let!(:score2) { create(:score) }

    it 'works' do
      expect(ScoreResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['scores'])
      expect(d.map(&:id)).to match_array([score1.id, score2.id])
    end
  end
end
