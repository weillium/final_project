require 'rails_helper'

RSpec.describe "scores#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/scores/#{score.id}"
  end

  describe 'basic destroy' do
    let!(:score) { create(:score) }

    it 'updates the resource' do
      expect(ScoreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Score.count }.by(-1)
      expect { score.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
