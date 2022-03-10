require 'rails_helper'

RSpec.describe Photo, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:upload_user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:agenda_item_id) }

    it { should validate_presence_of(:photo) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:upload_user_id) }

    end
end
