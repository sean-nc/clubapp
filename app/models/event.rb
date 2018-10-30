class Event < ApplicationRecord
  belongs_to :venue

  validates :venue_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
end
