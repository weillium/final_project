require "rails_helper"

RSpec.describe MessageGroupResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "message_groups",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MessageGroupResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { MessageGroup.count }.by(1)
    end
  end

  describe "updating" do
    let!(:message_group) { create(:message_group) }

    let(:payload) do
      {
        data: {
          id: message_group.id.to_s,
          type: "message_groups",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MessageGroupResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { message_group.reload.updated_at }
      # .and change { message_group.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:message_group) { create(:message_group) }

    let(:instance) do
      MessageGroupResource.find(id: message_group.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { MessageGroup.count }.by(-1)
    end
  end
end
