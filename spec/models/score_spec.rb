require 'rails_helper'

RSpec.describe Score, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:family_id) }

    it { should validate_presence_of(:score) }

    end
end
