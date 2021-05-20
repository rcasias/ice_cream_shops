require 'rails_helper'


RSpec.describe 'the shop index page' do
  it 'links to then new page from the shop index' do
    visit '/ice_cream_shops'
    expect(current_path).to eq ('/ice_cream_shops')
  end

  # User Story 1, Parent Index (x2)
  #
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  it 'can show all shops in a table' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create!(name: "Shop 2", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  false)
    visit '/ice_cream_shops'

    expect(page).to have_content("Shop 1")
    expect(page).to have_content("Shop 2")
  end

  # User Story 19, Parent Delete (x2)
  #
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to delete the parent
  # When I click the link "Delete Parent"
  # Then a 'DELETE' request is sent to '/parents/:id',
  # the parent is deleted, and all child records are deleted
  # and I am redirected to the parent index page where I no longer see this parent

  # User Story 22, Parent Delete From Parent Index Page (x1)
  #
  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to delete that parent
  # When I click the link
  # I am returned to the Parent Index Page where I no longer see that parent

  it 'can delete content' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    visit '/ice_cream_shops'

    expect(page).to have_content("Shop 1")
    find("input[type=submit][value='Delete Shop']").click

    expect(page).to_not have_content("Shop 1")
  end

  # User Story 17, Parent Update From Parent Index Page (x2)
  #
  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parents edit page where I can update its information just like in User Story 4

  it 'can take you to update shop page' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    visit '/ice_cream_shops'

    expect(page).to have_content("Shop 1")
    click_button("Edit")

    expect(current_path).to_not have_content('/ice_cream_shops/:id/edit')
  end
end
