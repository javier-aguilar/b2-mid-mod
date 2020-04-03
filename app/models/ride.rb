class Ride < ApplicationRecord

  validates :name, presence: true
  validates :thrill_rating, numericality: true

  belongs_to :park

  default_scope { order(name: :asc) }

end
