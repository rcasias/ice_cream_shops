require 'rails_helper'

RSpec.describe Shop, type: :model do
  it {should have_many :flavors}

  it 'will return delivery' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vamilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  false)
    expect(shop.delivery?).to eq('Yes')
    expect(shop2.delivery?).to eq('No')
  end

  it 'will return false delivery' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vamilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  false)
    expect(shop.has_delivery).to eq(true)
    expect(shop2.has_delivery).to eq(false)
  end

  # User Story 6, Parent Index sorted by Most Recently Created (x2)
  #
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'can sort by date' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vamilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  true)
    expect(Shop.order_shop_by_desc_date.first).to eq(shop2)
  end

  it 'can sort by date' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vamilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  true)
    expect(Shop.order_shop_by_desc_date).to eq([shop2, shop])
  end

  it 'can sort by date DESC' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vanilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  true)
    expect(Shop.order('created_at DESC')).to eq([shop2, shop])
  end

  it 'can return total shops' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.5, hours_of_operation: "4-9", has_delivery:  true)
    shop2 = Shop.create(name: "Vamilla", address: "456", phone_number: "777-777-7777", rating: 4.9, hours_of_operation: "4-9", has_delivery:  true)
    expect(Shop.count).to eq(2)
  end

  it 'can tell you no for having nuts' do
    shop = Shop.create(name: "Ice Cream", address: "123", phone_number: "999-999-9999", rating: 4.534234, hours_of_operation: "4-9", has_delivery:  true)
    expect(shop.rounded_rating).to eq(4.5)
  end
end
