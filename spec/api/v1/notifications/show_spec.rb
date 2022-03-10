require "rails_helper"

RSpec.describe "notifications#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/notifications/#{notification.id}", params: params
  end

  describe "basic fetch" do
    let!(:notification) { create(:notification) }

    it "works" do
      expect(NotificationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("notifications")
      expect(d.id).to eq(notification.id)
    end
  end
end
