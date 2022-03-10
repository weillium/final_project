require 'rails_helper'

RSpec.describe AgendaItem, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:leader_id) }

    it { should validate_presence_of(:location) }

    it { should validate_presence_of(:start_time) }

    end
end
