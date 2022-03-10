require "rails_helper"

RSpec.describe "scores#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/scores/#{score.id}", params: params
  end

  describe "basic fetch" do
    let!(:score) { create(:score) }

    it "works" do
      expect(ScoreResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("scores")
      expect(d.id).to eq(score.id)
    end
  end
end
