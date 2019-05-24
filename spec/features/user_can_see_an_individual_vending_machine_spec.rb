require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name: "Kit Kat", price: 1)
    snack2 = dons.snacks.create!(name: "Reese's", price: 2)
    snack3 = dons.snacks.create!(name: "Chips", price: 3)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
end
