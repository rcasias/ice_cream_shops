# [ ] done
#
# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'the shop show page' do
  it 'links to the shop show' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    visit '/ice_cream_shops'
    save_and_open_page
    click_link("#{shop.name}")
    expect(current_path).to eq ("/ice_cream_shops/#{shop.id}")
  end

  it 'can parent with that id including the parents attributes' do
    shop = Shop.create!(name: "Shop 1", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    visit "/ice_cream_shops/#{shop.id}"

    expect(page).to have_content("Shop 1")
    expect(page).to have_content("123")
    expect(page).to have_content("999-999-9999")
    expect(page).to have_content(4.5)
    expect(page).to have_content("4-9")
    expect(page).to have_content("Yes")
  end
end
