require 'rails_helper'

RSpec.describe AgendaItemResource, type: :resource do
  describe 'serialization' do
    let!(:agenda_item) { create(:agenda_item) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(agenda_item.id)
      expect(data.jsonapi_type).to eq('agenda_items')
    end
  end

  describe 'filtering' do
    let!(:agenda_item1) { create(:agenda_item) }
    let!(:agenda_item2) { create(:agenda_item) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: agenda_item2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([agenda_item2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:agenda_item1) { create(:agenda_item) }
      let!(:agenda_item2) { create(:agenda_item) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            agenda_item1.id,
            agenda_item2.id
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
            agenda_item2.id,
            agenda_item1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
