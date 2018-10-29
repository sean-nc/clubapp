class Venue < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, presence: :true
  validates :location, presence: :true
  validates :age, presence: :true
end
