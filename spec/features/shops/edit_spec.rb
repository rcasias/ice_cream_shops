# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'the shop edit' do
  it 'links to then edit page' do
    shop = Shop.create!(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    visit '/ice_cream_shops'

    click_button('Edit')
    expect(current_path).to eq ("/ice_cream_shops/#{shop.id}")
  end

  # it 'can create a new shop' do
  #   visit '/ice_cream_shops/new'
  #   fill_in('Name', with: 'Straberry')
  #   click_button('Create Shop')
  #
  #   expect(current_path).to eq("/ice_cream_shops")
  #   expect(page).to have_content("Straberry")
  # end
end
