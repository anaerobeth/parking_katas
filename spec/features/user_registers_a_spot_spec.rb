require 'spec_helper'

feature 'user registers a spot', %Q{
  As a parker
  I want to register my spot with my name
  So that the parking company can identify my car } do

  # Acceptance Criteria:
  # I must specify a first name, last name, email, and parking spot number
  # I must enter a valid parking spot number (the lot has spots identified as numbers 1-60)
  # I must enter a valid email

  scenario 'registers spot with valid information' do

    prev_count = ParkingRegistration.count
    visit '/'
    fill_in 'Email', with: 'Beth'
    fill_in 'First name', with: 'Beth'
    fill_in 'Last name', with: 'Beth'
    fill_in 'Spot number', with: '5'
    click_button 'Register'
    expect(page).to have_content('You registered succesfully')
    expect(ParkingRegistration.count).to eql(prev_count + 1)
  end

  scenario 'attempts to register a spot with invalid information' do

    prev_count = ParkingRegistration.count
    visit '/'
    fill_in 'Email', with: 'Beth'
    click_button 'Register'
    expect(page).to_not have_content('You registered succesfully')
    expect(ParkingRegistration.count).to eql(prev_count)
  end
end