require "rails_helper"

RSpec.describe "group_members#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/group_members/#{group_member.id}", params: params
  end

  describe "basic fetch" do
    let!(:group_member) { create(:group_member) }

    it "works" do
      expect(GroupMemberResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("group_members")
      expect(d.id).to eq(group_member.id)
    end
  end
end
