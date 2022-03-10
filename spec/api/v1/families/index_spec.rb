require 'rails_helper'

RSpec.describe "families#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/families", params: params
  end

  describe 'basic fetch' do
    let!(:family1) { create(:family) }
    let!(:family2) { create(:family) }

    it 'works' do
      expect(FamilyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['families'])
      expect(d.map(&:id)).to match_array([family1.id, family2.id])
    end
  end
end
