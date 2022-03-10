require "rails_helper"

RSpec.describe UserTypeResource, type: :resource do
  describe "serialization" do
    let!(:user_type) { create(:user_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_type.id)
      expect(data.jsonapi_type).to eq("user_types")
    end
  end

  describe "filtering" do
    let!(:user_type1) { create(:user_type) }
    let!(:user_type2) { create(:user_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_type1) { create(:user_type) }
      let!(:user_type2) { create(:user_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_type1.id,
                                      user_type2.id,
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
                                      user_type2.id,
                                      user_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
