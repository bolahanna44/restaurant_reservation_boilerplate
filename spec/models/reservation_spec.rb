require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "validations" do

    context "with valid attributes" do
      it "should be valid with start time and covers" do
        expect(build(:reservation)).to be_valid
      end
    end

    context "with invalid attributes" do
      it "should be invalid without start time" do
        expect(build(:reservation, start_time: nil)).not_to be_valid
      end

      it "should be invalid without covers" do
        expect(build(:reservation, covers: nil)).not_to be_valid
      end
    end
  end
end
