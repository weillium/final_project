require "rails_helper"

RSpec.describe "budget_lines#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budget_lines/#{budget_line.id}", params: params
  end

  describe "basic fetch" do
    let!(:budget_line) { create(:budget_line) }

    it "works" do
      expect(BudgetLineResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("budget_lines")
      expect(d.id).to eq(budget_line.id)
    end
  end
end
