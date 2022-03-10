require 'rails_helper'

RSpec.describe Score, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:family) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:family_id) }

    it { should validate_presence_of(:score) }

    end
end
