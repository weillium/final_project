require "rails_helper"

RSpec.describe "message_groups#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/message_groups/#{message_group.id}", payload
  end

  describe "basic update" do
    let!(:message_group) { create(:message_group) }

    let(:payload) do
      {
        data: {
          id: message_group.id.to_s,
          type: "message_groups",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MessageGroupResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { message_group.reload.attributes }
    end
  end
end
