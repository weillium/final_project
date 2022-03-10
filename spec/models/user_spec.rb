require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:notifications) }

    it { should have_many(:messages) }

    it { should have_many(:tags) }

    it { should have_many(:comments) }

    it { should have_many(:photos) }

    it { should have_many(:agenda_items) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:adventure_score) }

    it { should validate_numericality_of(:adventure_score).is_less_than(5).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of(:beachwater_score) }

    it { should validate_numericality_of(:beachwater_score).is_less_than(5).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:freetime_score) }

    it { should validate_numericality_of(:freetime_score).is_less_than(5).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of(:last_name) }

    it { should validate_numericality_of(:nightlife_score).is_less_than(5).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of(:phone_number) }

    it { should validate_presence_of(:user_type_id) }

    it { should validate_presence_of(:walkup_song) }

    end
end
