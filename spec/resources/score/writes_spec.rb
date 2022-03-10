require "rails_helper"

RSpec.describe ScoreResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "scores",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ScoreResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Score.count }.by(1)
    end
  end

  describe "updating" do
    let!(:score) { create(:score) }

    let(:payload) do
      {
        data: {
          id: score.id.to_s,
          type: "scores",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ScoreResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { score.reload.updated_at }
      # .and change { score.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:score) { create(:score) }

    let(:instance) do
      ScoreResource.find(id: score.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Score.count }.by(-1)
    end
  end
end
