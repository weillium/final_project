require 'rails_helper'

RSpec.describe "group_members#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/group_members/#{group_member.id}", payload
  end

  describe 'basic update' do
    let!(:group_member) { create(:group_member) }

    let(:payload) do
      {
        data: {
          id: group_member.id.to_s,
          type: 'group_members',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GroupMemberResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { group_member.reload.attributes }
    end
  end
end
