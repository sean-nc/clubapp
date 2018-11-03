class TicketOption < ApplicationRecord
  belongs_to :event

  validates :price, presence: true
  validates :limit, presence: true
  validates :name, presence: true
  validates :expiration, presence: true
end
