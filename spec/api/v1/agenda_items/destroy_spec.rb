require 'rails_helper'

RSpec.describe "agenda_items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/agenda_items/#{agenda_item.id}"
  end

  describe 'basic destroy' do
    let!(:agenda_item) { create(:agenda_item) }

    it 'updates the resource' do
      expect(AgendaItemResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AgendaItem.count }.by(-1)
      expect { agenda_item.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
