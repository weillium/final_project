require 'rails_helper'

RSpec.describe "user_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_types", params: params
  end

  describe 'basic fetch' do
    let!(:user_type1) { create(:user_type) }
    let!(:user_type2) { create(:user_type) }

    it 'works' do
      expect(UserTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['user_types'])
      expect(d.map(&:id)).to match_array([user_type1.id, user_type2.id])
    end
  end
end
