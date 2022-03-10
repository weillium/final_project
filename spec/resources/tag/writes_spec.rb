require "rails_helper"

RSpec.describe TagResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "tags",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TagResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Tag.count }.by(1)
    end
  end

  describe "updating" do
    let!(:tag) { create(:tag) }

    let(:payload) do
      {
        data: {
          id: tag.id.to_s,
          type: "tags",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TagResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { tag.reload.updated_at }
      # .and change { tag.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:tag) { create(:tag) }

    let(:instance) do
      TagResource.find(id: tag.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Tag.count }.by(-1)
    end
  end
end
