require 'rails_helper'

RSpec.describe "notifications#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/notifications", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'notifications',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NotificationResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Notification.count }.by(1)
    end
  end
end
