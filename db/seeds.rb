# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FactoryBot.define do
  factory :shop do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.phone_number}
    hours_of_operation { rand(1..4) }
    has_delivery { rand(2) == 0 }
    rating { rand(3.0..5.0) }
  end

  factory :flavor do
    flavor_name { Faker::Dessert.flavor }
    dairy_free { rand(2) == 0 }
    nut_free { rand(2) == 0 }
    calories_per_scoop { rand(150..500) }
    price_per_scoop { rand(1.00..4.00) }
  end
end

10.times do
  shop = Shop.create!(FactoryBot::attributes_for(:shop))
  rand(5..10).times do
    attrs = FactoryBot::attributes_for(:flavor)
    shop.flavors.create!(attrs)
  end
end
