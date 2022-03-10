require 'rails_helper'

RSpec.describe "agenda_items#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/agenda_items/#{agenda_item.id}", payload
  end

  describe 'basic update' do
    let!(:agenda_item) { create(:agenda_item) }

    let(:payload) do
      {
        data: {
          id: agenda_item.id.to_s,
          type: 'agenda_items',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AgendaItemResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { agenda_item.reload.attributes }
    end
  end
end
