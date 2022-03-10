require "rails_helper"

RSpec.describe "agenda_items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/agenda_items/#{agenda_item.id}", params: params
  end

  describe "basic fetch" do
    let!(:agenda_item) { create(:agenda_item) }

    it "works" do
      expect(AgendaItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("agenda_items")
      expect(d.id).to eq(agenda_item.id)
    end
  end
end
