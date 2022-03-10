require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:phone_number) }

    it { should validate_presence_of(:user_type_id) }

    it { should validate_presence_of(:walkup_song) }

    end
end
