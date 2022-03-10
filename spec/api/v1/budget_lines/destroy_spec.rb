require 'rails_helper'

RSpec.describe "budget_lines#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/budget_lines/#{budget_line.id}"
  end

  describe 'basic destroy' do
    let!(:budget_line) { create(:budget_line) }

    it 'updates the resource' do
      expect(BudgetLineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BudgetLine.count }.by(-1)
      expect { budget_line.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
