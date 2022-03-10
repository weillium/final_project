require 'rails_helper'

RSpec.describe NotificationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'notifications',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NotificationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Notification.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:notification) { create(:notification) }

    let(:payload) do
      {
        data: {
          id: notification.id.to_s,
          type: 'notifications',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NotificationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { notification.reload.updated_at }
      # .and change { notification.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:notification) { create(:notification) }

    let(:instance) do
      NotificationResource.find(id: notification.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Notification.count }.by(-1)
    end
  end
end
