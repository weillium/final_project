require 'rails_helper'

RSpec.describe MessageGroupResource, type: :resource do
  describe 'serialization' do
    let!(:message_group) { create(:message_group) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(message_group.id)
      expect(data.jsonapi_type).to eq('message_groups')
    end
  end

  describe 'filtering' do
    let!(:message_group1) { create(:message_group) }
    let!(:message_group2) { create(:message_group) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: message_group2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([message_group2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:message_group1) { create(:message_group) }
      let!(:message_group2) { create(:message_group) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            message_group1.id,
            message_group2.id
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
            message_group2.id,
            message_group1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
