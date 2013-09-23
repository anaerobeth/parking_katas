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
    create_registration_for(5)
    expect(page).to have_content('You have no neighbors')

  end


  scenario 'there is a neighbor at spot - 1' do
    neighbor_first_name = 'Beth'
    FactoryGirl.create(:parking_registration,
      first_name: neighbor_first_name,
      spot_number: 4)
    create_registration_for(5)
    expect(page).to have_content(neighbor_first_name)

  end

  scenario 'there is a neighbor at spot + 1' do
    neighbor_first_name = 'Bob'
    FactoryGirl.create(:parking_registration,
      first_name: neighbor_first_name,
      spot_number: 6)
    create_registration_for(5)
    expect(page).to have_content(neighbor_first_name)

  end


  def create_registration_for(spot_number)
    visit '/'
    fill_in 'Email', with: 'beth@gmail.com'
    fill_in 'First name', with: 'Beth'
    fill_in 'Last name', with: 'Tenorio'
    fill_in 'Spot number', with: '5'
    click_button 'Register'
  end

end
