require "application_system_test_case"

class FlatsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # 1- Tell it which page to actually go to.
    visit root_url
    # 2- Tells it what to look for inside of our file
    assert_selector "h1", text: "Flats"
  end

  test 'all my flats are being listed in my flats#index' do
    visit root_url
    assert_selector 'li', count: 6
  end

  test 'check that each <li> is a link' do
    visit root_url
    assert_selector 'a', count: 6
  end

  test 'check that the links lead to the flat\'s show page' do
    visit 'flats/148'
    assert_selector 'h1', text: 'Trendy Apt in Buttes Montmartre'
  end

  test 'leading to the right show page' do
    visit root_url
    click_on 'Trendy Apt in Buttes Montmartre'
    assert_selector 'h1', text: 'Trendy Apt in Buttes Montmartre'
  end
end
