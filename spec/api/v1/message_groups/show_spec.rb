require "rails_helper"

RSpec.describe "message_groups#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/message_groups/#{message_group.id}", params: params
  end

  describe "basic fetch" do
    let!(:message_group) { create(:message_group) }

    it "works" do
      expect(MessageGroupResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("message_groups")
      expect(d.id).to eq(message_group.id)
    end
  end
end
