require 'rails_helper'

RSpec.describe Flavor, type: :model do
  it {should belong_to :shop}

  it 'can return all flavors' do
    shop = Shop.create!(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create!(flavor_name: "Vanilla", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create!(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.all.count).to eq(2)
  end

  it 'can return all flavors' do
    shop = Shop.create!(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create!(flavor_name: "Vanilla", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create!(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor3 = shop.flavors.create!(flavor_name: "Strawberry", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.total_number_of_flavors).to eq(3)
  end

  it 'will sort flavors by name' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.sort_flavors_by_name).to eq([flavor2, flavor])
  end

  it 'can sort out false booleans' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.sort_out_false_booleans).to eq([flavor])
  end

  it 'can alphabatize with order keyword' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.order(:flavor_name)).to eq([flavor2, flavor])
  end

  it 'can sort booleans dairy free is true' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.where('dairy_free' => true)).to eq([flavor])
  end

  it 'can sort booleans nut free is true' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.where('nut_free' => true)).to eq([flavor, flavor2])
  end

  it 'can sort out false booleans' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(Flavor.sort_out_false_booleans).to eq([flavor])
  end

  it 'can tell you yes for having dairy' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(flavor.dairy?).to eq('Yes')
  end

  it 'can tell you no for having dairy' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(flavor2.dairy?).to eq('No')
  end

  it 'can tell you yes for having nuts' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(flavor.nuts?).to eq('Yes')
  end

  it 'can tell you no for having nuts' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    flavor = shop.flavors.create(flavor_name: "Vanilla", dairy_free: true, nut_free: true, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    flavor2 = shop.flavors.create(flavor_name: "Chocolate", dairy_free: false, nut_free: false, price_per_scoop: 2.5, calories_per_scoop: 100, shop_id: 1)
    expect(flavor2.nuts?).to eq('No')
  end
end
