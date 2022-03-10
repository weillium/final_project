require 'rails_helper'

RSpec.describe "message_groups#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/message_groups", payload
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
          type: 'message_groups',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(MessageGroupResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { MessageGroup.count }.by(1)
    end
  end
end
