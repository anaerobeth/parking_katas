FactoryGirl.define do
  factory :parking_registration do
    first_name 'Beth'
    last_name 'Tenorio'
    email 'beth@gamail.com'
    spot_number 3
    parked_on { Date.today }
  end
end