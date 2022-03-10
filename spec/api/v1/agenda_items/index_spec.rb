require 'rails_helper'

RSpec.describe "agenda_items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/agenda_items", params: params
  end

  describe 'basic fetch' do
    let!(:agenda_item1) { create(:agenda_item) }
    let!(:agenda_item2) { create(:agenda_item) }

    it 'works' do
      expect(AgendaItemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['agenda_items'])
      expect(d.map(&:id)).to match_array([agenda_item1.id, agenda_item2.id])
    end
  end
end
