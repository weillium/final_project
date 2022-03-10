require 'rails_helper'

RSpec.describe "budget_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/budget_types", params: params
  end

  describe 'basic fetch' do
    let!(:budget_type1) { create(:budget_type) }
    let!(:budget_type2) { create(:budget_type) }

    it 'works' do
      expect(BudgetTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['budget_types'])
      expect(d.map(&:id)).to match_array([budget_type1.id, budget_type2.id])
    end
  end
end
