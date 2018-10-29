class Event < ApplicationRecord
  belongs_to :venue
  validates :venue_id, precense: true
  validates :start_time, precense: true
  validates :end_time, precense: true
  validates :name, precense: true
end
