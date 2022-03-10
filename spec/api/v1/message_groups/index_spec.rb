require 'rails_helper'

RSpec.describe "message_groups#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/message_groups", params: params
  end

  describe 'basic fetch' do
    let!(:message_group1) { create(:message_group) }
    let!(:message_group2) { create(:message_group) }

    it 'works' do
      expect(MessageGroupResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['message_groups'])
      expect(d.map(&:id)).to match_array([message_group1.id, message_group2.id])
    end
  end
end
