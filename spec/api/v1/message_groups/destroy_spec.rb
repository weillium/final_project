require 'rails_helper'

RSpec.describe "message_groups#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/message_groups/#{message_group.id}"
  end

  describe 'basic destroy' do
    let!(:message_group) { create(:message_group) }

    it 'updates the resource' do
      expect(MessageGroupResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { MessageGroup.count }.by(-1)
      expect { message_group.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
