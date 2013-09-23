require 'spec_helper'

describe ParkingRegistration do
  it {should have_valid(:email).when('beth@example.com')}
  it {should_not have_valid(:email).when(nil, '')}

  it {should have_valid(:last_name).when('James', 'Sue')}
  it {should_not have_valid(:last_name).when(nil, '')}

  it {should have_valid(:first_name).when('Jones', 'Stone')}
  it {should_not have_valid(:first_name).when(nil, '')}

  it {should have_valid(:spot_number).when(1,4,39)}
  it {should_not have_valid(:spot_number).when(nil, -32, "abc")}

  it {should have_valid(:parked_on).when(Date.today)}

  describe 'parking' do
    it 'parks the car for today' do
      registration = FactoryGirl.build(:parking_registration, parked_on: nil)
      expect(registration.park).to eql(true)
      expect(registration.parked_on).to eql(Date.today)
    end

    it 'allows only one spot per day' do
      prev_registration = FactoryGirl.create(:parking_registration)
      registration = FactoryGirl.build(:parking_registration,
        spot_number: prev_registration.spot_number,
        parked_on: prev_registration.parked_on)
      expect(registration.park).to be_false
      expect(registration).to_not be_valid
      expect(registration.errors[:spot_number]).to_not be_blank
    end
  end
end
