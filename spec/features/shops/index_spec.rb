require 'rails_helper'

# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system


RSpec.describe 'the shop index page' do
  it 'links to then new page from the shop index' do
    visit '/ice_cream_shops'
    expect(current_path).to eq ('/ice_cream_shops')
  end

  it 'can show all shops in a table' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create!(name: "Shop 2", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  false)
    visit '/ice_cream_shops'

    save_and_open_page
    expect(page).to have_content("Shop 1")
    expect(page).to have_content("Shop 2")
  end
end
