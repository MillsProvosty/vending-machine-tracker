require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the names of all snacks associated with that vending machine, and price' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name: "Kit Kat", price: 1)
    snack2 = Snack.create!(name: "Reese's", price: 2)
    snack3 = Snack.create!(name: "Chips", price: 3)

    visit machine_path(dons)
save_and_open_page
    expect(page).to have_content("#{snack1.name} : #{snack1.price}")
    expect(page).to have_content("#{snack2.name} : #{snack2.price}")
    expect(page).to have_content("#{snack3.name} : #{snack3.price}")

  end

  it 'shows average price for each machine' do

    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name: "Kit Kat", price: 1)
    snack2 = dons.snacks.create!(name: "Reese's", price: 2)
    snack3 = dons.snacks.create!(name: "Chips", price: 3)


    expect(page).to have_content("Average Price: $2")

  end
end
