require 'rails_helper'

RSpec.describe GroupMemberResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'group_members',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GroupMemberResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { GroupMember.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:group_member) { create(:group_member) }

    let(:payload) do
      {
        data: {
          id: group_member.id.to_s,
          type: 'group_members',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GroupMemberResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { group_member.reload.updated_at }
      # .and change { group_member.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:group_member) { create(:group_member) }

    let(:instance) do
      GroupMemberResource.find(id: group_member.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { GroupMember.count }.by(-1)
    end
  end
end
