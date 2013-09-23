require 'spec_helper'

feature 'user registers a spot', %Q{
  As a parker
  I want to see my two neighbors
  So that I can get to know them better
  } do

  # Acceptance Criteria:

  # After checking in, if I have a neighbor in a slot 1 below me, or one above me, I am informed of their name and what slot number they are currently in
  # If I do not have anyone parking next to me, I am told that I have no current neighbors

  scenario 'there are no neighbors' do

    visit '/'
    fill_in 'Email', with: 'beth@gmail.com'
    fill_in 'First name', with: 'Beth'
    fill_in 'Last name', with: 'Tenorio'
    fill_in 'Spot number', with: '5'
    click_button 'Register'

    expect(page).to have_content('You have no neighbors')

  end


  # scenario 'there is a neighbor at spot - 1' do
  #   prev_count = ParkingRegistration.count
  #   visit '/'
  #   fill_in 'Email', with: 'beth@gmail.com'
  #   fill_in 'First name', with: 'Beth'
  #   fill_in 'Last name', with: 'Tenorio'
  #   fill_in 'Spot number', with: '5'
  #   click_button 'Register'

  #   expect(page).to have_content('You registered successfully')
  #   expect(ParkingRegistration.count).to eql(prev_count + 1)
  # end

  # scenario 'there is a neighbor at spot + 1' do
  #   prev_count = ParkingRegistration.count
  #   visit '/'
  #   fill_in 'Email', with: 'beth@gmail.com'
  #   fill_in 'First name', with: 'Beth'
  #   fill_in 'Last name', with: 'Tenorio'
  #   fill_in 'Spot number', with: '5'
  #   click_button 'Register'

  #   expect(page).to have_content('You registered successfully')
  #   expect(ParkingRegistration.count).to eql(prev_count + 1)
  # end

end
