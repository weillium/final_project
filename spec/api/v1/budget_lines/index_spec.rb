require "rails_helper"

RSpec.describe "budget_lines#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budget_lines", params: params
  end

  describe "basic fetch" do
    let!(:budget_line1) { create(:budget_line) }
    let!(:budget_line2) { create(:budget_line) }

    it "works" do
      expect(BudgetLineResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["budget_lines"])
      expect(d.map(&:id)).to match_array([budget_line1.id, budget_line2.id])
    end
  end
end
