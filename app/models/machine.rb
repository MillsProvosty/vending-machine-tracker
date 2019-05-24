class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks


  def average_price
    total_price = snacks.sum do |snack|
      snack.price
    end

    total_snacks = 0
    snacks.each do |snack|
      total_snacks += 1
    end
    total_price/total_snacks
  end

end
