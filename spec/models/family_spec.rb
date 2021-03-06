require "rails_helper"

RSpec.describe Family, type: :model do
  describe "Direct Associations" do
    it { should have_many(:scores) }

    it { should have_many(:users) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
