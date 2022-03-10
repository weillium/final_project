require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:photo) }

    it { should belong_to(:taggee) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:photo_id) }

    it { should validate_presence_of(:tagged_id) }
  end
end
