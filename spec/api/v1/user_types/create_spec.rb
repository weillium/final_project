require 'rails_helper'

RSpec.describe "user_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/user_types", payload
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
          type: 'user_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(UserTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { UserType.count }.by(1)
    end
  end
end
