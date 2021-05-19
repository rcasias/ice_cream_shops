# [ ] done
#
# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'the shop creation' do
  it 'links to then new page from the shop index' do
    visit '/ice_cream_shops'
    # save_and_open_page
    click_link('New Shop')
    expect(current_path).to eq ('/ice_cream_shops/new')
  end

  it 'can create a new shop' do
    visit '/ice_cream_shops/new'
    fill_in('name', with: "New Shop Name")
    save_and_open_page
    fill_in('shop[address]', with: '1234')
    fill_in('shop[phone_number]', with: '9999999999')
    fill_in('shop[hours_of_operation]', with: '1-4')
    page.choose('shop[has_delivery]', with: 'true')
    fill_in('shop[rating]', with: '4.5')
    # binding.pry
    find('input[name="Submit"]').click
    expect(current_path).to eq('/ice_cream_shops')
    expect(page).to have_content('New Shop Name')
  end
end
