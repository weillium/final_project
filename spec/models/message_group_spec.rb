require "rails_helper"

RSpec.describe MessageGroup, type: :model do
  describe "Direct Associations" do
    it { should have_many(:group_members) }

    it { should have_many(:messages) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
