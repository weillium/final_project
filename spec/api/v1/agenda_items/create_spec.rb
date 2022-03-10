require 'rails_helper'

RSpec.describe "agenda_items#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/agenda_items", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'agenda_items',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AgendaItemResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AgendaItem.count }.by(1)
    end
  end
end
