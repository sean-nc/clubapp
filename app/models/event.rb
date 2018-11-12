class Event < ApplicationRecord
  belongs_to :venue
  has_many :ticket_options, dependent: :destroy
  has_many :tickets, through: :ticket_options

  validates :venue_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  validate :valid_time

  def valid_time
    if end_time <= start_time || end_time <= Time.now
      errors.add(:base, "The time for you event isn't valid.")
    end
  end
end
