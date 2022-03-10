require "rails_helper"

RSpec.describe "budget_lines#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/budget_lines/#{budget_line.id}", payload
  end

  describe "basic update" do
    let!(:budget_line) { create(:budget_line) }

    let(:payload) do
      {
        data: {
          id: budget_line.id.to_s,
          type: "budget_lines",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BudgetLineResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { budget_line.reload.attributes }
    end
  end
end
