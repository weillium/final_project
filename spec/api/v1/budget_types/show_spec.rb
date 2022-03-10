require "rails_helper"

RSpec.describe "budget_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budget_types/#{budget_type.id}", params: params
  end

  describe "basic fetch" do
    let!(:budget_type) { create(:budget_type) }

    it "works" do
      expect(BudgetTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("budget_types")
      expect(d.id).to eq(budget_type.id)
    end
  end
end
