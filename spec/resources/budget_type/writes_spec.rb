require 'rails_helper'

RSpec.describe BudgetTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'budget_types',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BudgetTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BudgetType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:budget_type) { create(:budget_type) }

    let(:payload) do
      {
        data: {
          id: budget_type.id.to_s,
          type: 'budget_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BudgetTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { budget_type.reload.updated_at }
      # .and change { budget_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:budget_type) { create(:budget_type) }

    let(:instance) do
      BudgetTypeResource.find(id: budget_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BudgetType.count }.by(-1)
    end
  end
end
