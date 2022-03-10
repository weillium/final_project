require 'rails_helper'

RSpec.describe "group_members#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/group_members/#{group_member.id}"
  end

  describe 'basic destroy' do
    let!(:group_member) { create(:group_member) }

    it 'updates the resource' do
      expect(GroupMemberResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { GroupMember.count }.by(-1)
      expect { group_member.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
