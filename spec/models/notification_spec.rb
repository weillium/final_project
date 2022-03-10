require 'rails_helper'

RSpec.describe Notification, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:creator_id) }

    it { should validate_presence_of(:title) }

    end
end
