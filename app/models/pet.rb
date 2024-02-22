class Pet < ApplicationRecord
  SPECIES = ['cat', 'dog', 'hamster', 'rabbit',  'bird']

  validates :color, :location, :found_on, presence: true
  validates :species, inclusion: { in: SPECIES }

  def found_days_ago
    (Date.today - self.found_on).to_i
  end
end
