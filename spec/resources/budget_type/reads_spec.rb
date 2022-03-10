require 'rails_helper'

RSpec.describe BudgetTypeResource, type: :resource do
  describe 'serialization' do
    let!(:budget_type) { create(:budget_type) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(budget_type.id)
      expect(data.jsonapi_type).to eq('budget_types')
    end
  end

  describe 'filtering' do
    let!(:budget_type1) { create(:budget_type) }
    let!(:budget_type2) { create(:budget_type) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: budget_type2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([budget_type2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:budget_type1) { create(:budget_type) }
      let!(:budget_type2) { create(:budget_type) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            budget_type1.id,
            budget_type2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            budget_type2.id,
            budget_type1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
