require "rails_helper"

RSpec.describe NotificationResource, type: :resource do
  describe "serialization" do
    let!(:notification) { create(:notification) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(notification.id)
      expect(data.jsonapi_type).to eq("notifications")
    end
  end

  describe "filtering" do
    let!(:notification1) { create(:notification) }
    let!(:notification2) { create(:notification) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: notification2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([notification2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:notification1) { create(:notification) }
      let!(:notification2) { create(:notification) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      notification1.id,
                                      notification2.id,
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
                                      notification2.id,
                                      notification1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
