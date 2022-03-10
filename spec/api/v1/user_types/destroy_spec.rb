require 'rails_helper'

RSpec.describe "user_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_types/#{user_type.id}"
  end

  describe 'basic destroy' do
    let!(:user_type) { create(:user_type) }

    it 'updates the resource' do
      expect(UserTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { UserType.count }.by(-1)
      expect { user_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
