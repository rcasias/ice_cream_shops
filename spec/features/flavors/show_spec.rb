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
    flavor2 = shop.flavors.create!(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    visit "/flavors/#{flavor.id}"
    expect(page).to have_content(flavor.flavor_name)
    expect(page).to_not have_content(flavor2.flavor_name)
  end

  it 'displays the attributes of a flavor' do
    shop = Shop.create!(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create!(flavor_name: "Vanilla", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create!(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    visit "/flavors/#{flavor.id}"
    expect(flavor.flavor_name).to eq('Vanilla')
    expect(flavor.dairy?).to eq('No')
    expect(flavor.nuts?).to eq('Yes')
    expect(flavor.price_per_scoop).to eq(2.5)
    expect(flavor.calories_per_scoop).to eq(100)
    expect(page).to have_content(shop.name)
  end
end
