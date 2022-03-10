require "rails_helper"

RSpec.describe BudgetLineResource, type: :resource do
  describe "serialization" do
    let!(:budget_line) { create(:budget_line) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(budget_line.id)
      expect(data.jsonapi_type).to eq("budget_lines")
    end
  end

  describe "filtering" do
    let!(:budget_line1) { create(:budget_line) }
    let!(:budget_line2) { create(:budget_line) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: budget_line2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([budget_line2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:budget_line1) { create(:budget_line) }
      let!(:budget_line2) { create(:budget_line) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      budget_line1.id,
                                      budget_line2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      budget_line2.id,
                                      budget_line1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
