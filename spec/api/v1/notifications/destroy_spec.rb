require 'rails_helper'

RSpec.describe "notifications#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/notifications/#{notification.id}"
  end

  describe 'basic destroy' do
    let!(:notification) { create(:notification) }

    it 'updates the resource' do
      expect(NotificationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Notification.count }.by(-1)
      expect { notification.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
