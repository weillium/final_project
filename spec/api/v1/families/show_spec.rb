require "rails_helper"

RSpec.describe "families#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/families/#{family.id}", params: params
  end

  describe "basic fetch" do
    let!(:family) { create(:family) }

    it "works" do
      expect(FamilyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("families")
      expect(d.id).to eq(family.id)
    end
  end
end
