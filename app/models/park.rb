class Park < ApplicationRecord

  validates :name, presence: true
  validates :admission, presence: true

  has_many :rides

  def average_thrill_rating
    rides.average(:thrill_rating)
  end

end
