require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  it '.average_price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: "Kit Kat", price: 1)
    snack2 = Snack.create(name: "Reese's", price: 2)
    snack3 = Snack.create(name: "Chips", price: 3)


    expect(dons.average_price).to eq(3)
  end
end
