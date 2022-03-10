require 'rails_helper'

RSpec.describe "scores#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/scores/#{score.id}", payload
  end

  describe 'basic update' do
    let!(:score) { create(:score) }

    let(:payload) do
      {
        data: {
          id: score.id.to_s,
          type: 'scores',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ScoreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { score.reload.attributes }
    end
  end
end
