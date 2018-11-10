class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event, through: :ticket_options
end
