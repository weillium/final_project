require "rails_helper"

RSpec.describe BudgetLineResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "budget_lines",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BudgetLineResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { BudgetLine.count }.by(1)
    end
  end

  describe "updating" do
    let!(:budget_line) { create(:budget_line) }

    let(:payload) do
      {
        data: {
          id: budget_line.id.to_s,
          type: "budget_lines",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BudgetLineResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { budget_line.reload.updated_at }
      # .and change { budget_line.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:budget_line) { create(:budget_line) }

    let(:instance) do
      BudgetLineResource.find(id: budget_line.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { BudgetLine.count }.by(-1)
    end
  end
end
