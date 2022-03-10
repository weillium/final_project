require "rails_helper"

RSpec.describe "budget_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/budget_types/#{budget_type.id}", payload
  end

  describe "basic update" do
    let!(:budget_type) { create(:budget_type) }

    let(:payload) do
      {
        data: {
          id: budget_type.id.to_s,
          type: "budget_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BudgetTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { budget_type.reload.attributes }
    end
  end
end
