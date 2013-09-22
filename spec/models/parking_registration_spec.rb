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
  end
end
