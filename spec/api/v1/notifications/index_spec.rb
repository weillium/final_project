require 'rails_helper'

RSpec.describe "notifications#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/notifications", params: params
  end

  describe 'basic fetch' do
    let!(:notification1) { create(:notification) }
    let!(:notification2) { create(:notification) }

    it 'works' do
      expect(NotificationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['notifications'])
      expect(d.map(&:id)).to match_array([notification1.id, notification2.id])
    end
  end
end
