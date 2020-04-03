class Mechanic < ApplicationRecord

  validates :name, presence: true
  validates :years_of_experience, numericality: true

end
