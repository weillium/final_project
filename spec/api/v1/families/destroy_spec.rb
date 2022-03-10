require 'rails_helper'

RSpec.describe "families#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/families/#{family.id}"
  end

  describe 'basic destroy' do
    let!(:family) { create(:family) }

    it 'updates the resource' do
      expect(FamilyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Family.count }.by(-1)
      expect { family.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
