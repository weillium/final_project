require 'rails_helper'

RSpec.describe AgendaItemResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'agenda_items',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AgendaItemResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AgendaItem.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:agenda_item) { create(:agenda_item) }

    let(:payload) do
      {
        data: {
          id: agenda_item.id.to_s,
          type: 'agenda_items',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AgendaItemResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { agenda_item.reload.updated_at }
      # .and change { agenda_item.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:agenda_item) { create(:agenda_item) }

    let(:instance) do
      AgendaItemResource.find(id: agenda_item.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AgendaItem.count }.by(-1)
    end
  end
end
