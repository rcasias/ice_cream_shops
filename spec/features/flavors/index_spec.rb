# ser Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:


require 'rails_helper'
# shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)

RSpec.describe 'Flavors Show Page' do

  # User Story 4, Child Show (x2)
  #
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'displays the flavor title' do
    shop = Shop.create!(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create!(flavor_name: "Vanilla", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    visit '/ice_cream_shops'
    save_and_open_page
    click_link ("Flavors Index")
    expect(current_path).to_not have_content("/flavors")
  end
end
