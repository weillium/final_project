require 'rails_helper'

RSpec.describe BudgetLine, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:budget_type_id) }

    it { should validate_presence_of(:budgeted_amount) }

    end
end
