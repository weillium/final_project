require 'rails_helper'

RSpec.describe AgendaItem, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:photos) }

    it { should belong_to(:leader) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:activity_name) }

    it { should validate_presence_of(:budget_line_id) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:end_time) }

    it { should validate_presence_of(:is_cyoa) }

    it { should validate_presence_of(:leader_id) }

    it { should validate_presence_of(:location) }

    it { should validate_presence_of(:start_time) }

    end
end
