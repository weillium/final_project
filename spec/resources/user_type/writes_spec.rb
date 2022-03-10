require 'rails_helper'

RSpec.describe UserTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'user_types',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UserTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UserType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:user_type) { create(:user_type) }

    let(:payload) do
      {
        data: {
          id: user_type.id.to_s,
          type: 'user_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UserTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { user_type.reload.updated_at }
      # .and change { user_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:user_type) { create(:user_type) }

    let(:instance) do
      UserTypeResource.find(id: user_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UserType.count }.by(-1)
    end
  end
end
