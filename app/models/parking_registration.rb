class ParkingRegistration < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_numericality_of :spot_number,
    only_integers: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 60
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def park
    self.parked_on = Date.today
    save!
  end

end
