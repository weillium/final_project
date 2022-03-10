require 'rails_helper'

RSpec.describe "notifications#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/notifications/#{notification.id}", payload
  end

  describe 'basic update' do
    let!(:notification) { create(:notification) }

    let(:payload) do
      {
        data: {
          id: notification.id.to_s,
          type: 'notifications',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(NotificationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { notification.reload.attributes }
    end
  end
end
