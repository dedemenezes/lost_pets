class Pet < ApplicationRecord
  validates :color, :location, :found_on, presence: true
  validates :species, inclusion: { in: ['cat', 'dog', 'hamster', 'rabbit'] }
end
