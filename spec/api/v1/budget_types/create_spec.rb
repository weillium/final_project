require "rails_helper"

RSpec.describe "budget_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/budget_types", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "budget_types",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(BudgetTypeResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { BudgetType.count }.by(1)
    end
  end
end
