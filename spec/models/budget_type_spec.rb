require "rails_helper"

RSpec.describe BudgetType, type: :model do
  describe "Direct Associations" do
    it { should have_many(:budgets) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:type_name) }
  end
end
