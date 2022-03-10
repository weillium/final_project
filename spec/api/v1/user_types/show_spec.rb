require 'rails_helper'

RSpec.describe "user_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_types/#{user_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:user_type) { create(:user_type) }

    it 'works' do
      expect(UserTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('user_types')
      expect(d.id).to eq(user_type.id)
    end
  end
end
