require "rails_helper"

RSpec.describe "group_members#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/group_members", params: params
  end

  describe "basic fetch" do
    let!(:group_member1) { create(:group_member) }
    let!(:group_member2) { create(:group_member) }

    it "works" do
      expect(GroupMemberResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["group_members"])
      expect(d.map(&:id)).to match_array([group_member1.id, group_member2.id])
    end
  end
end
