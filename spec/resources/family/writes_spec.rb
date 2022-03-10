require "rails_helper"

RSpec.describe FamilyResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "families",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FamilyResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Family.count }.by(1)
    end
  end

  describe "updating" do
    let!(:family) { create(:family) }

    let(:payload) do
      {
        data: {
          id: family.id.to_s,
          type: "families",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FamilyResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { family.reload.updated_at }
      # .and change { family.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:family) { create(:family) }

    let(:instance) do
      FamilyResource.find(id: family.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Family.count }.by(-1)
    end
  end
end
