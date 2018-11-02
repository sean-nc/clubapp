class CreateTicketOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_options do |t|
      t.integer :price
      t.datetime :expiration
      t.integer :limit

      t.timestamps
    end
  end
end
