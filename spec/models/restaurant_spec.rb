require 'rails_helper'

RSpec.describe Restaurant, type: :model do
 describe "validations" do

   context "with valid attributes" do
     it "should be valid with name, cuisines, email, location and opnening hours " do
      expect(build(:restaurant)).to be_valid
     end
   end

   context "with invalid attributes" do
     it "should be invalid without name" do
      expect(build(:restaurant, name: nil)).not_to be_valid
     end

     it "should be invalid without cuisines" do
       expect(build(:restaurant, cuisines: nil)).not_to be_valid
     end

     it "should be invalid without location" do
       expect(build(:restaurant, location: nil)).not_to be_valid
     end

     it "should be invalid without opening hours" do
       expect(build(:restaurant, opening_hours: nil)).not_to be_valid
     end
   end
 end
end
