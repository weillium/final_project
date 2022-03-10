require 'rails_helper'

RSpec.describe "budget_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/budget_types/#{budget_type.id}"
  end

  describe 'basic destroy' do
    let!(:budget_type) { create(:budget_type) }

    it 'updates the resource' do
      expect(BudgetTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BudgetType.count }.by(-1)
      expect { budget_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
