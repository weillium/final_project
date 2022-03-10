require 'rails_helper'

RSpec.describe "families#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/families/#{family.id}", payload
  end

  describe 'basic update' do
    let!(:family) { create(:family) }

    let(:payload) do
      {
        data: {
          id: family.id.to_s,
          type: 'families',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FamilyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { family.reload.attributes }
    end
  end
end
