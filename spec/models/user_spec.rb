require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    context "with valid attributes" do
      it 'should be valid with first name, last name, email, password and role' do
        expect(build(:guest)).to be_valid
      end
    end

    context "with invalid attributes" do
      it 'should not be valid without email' do
        expect(build(:guest, email: nil)).not_to be_valid
      end

      it 'should not be valid without first name' do
        expect(build(:guest, first_name: nil)).not_to be_valid
      end

      it 'should not be valid without last name' do
        expect(build(:guest, last_name: nil)).not_to be_valid
      end

      it 'should not be valid without password' do
        expect(build(:guest, password: nil)).not_to be_valid
      end
    end
  end
end
