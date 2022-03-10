require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:group_id) }

    it { should validate_presence_of(:user_id) }

    end
end
