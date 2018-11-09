class CreateTicketOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_options do |t|
      t.string :name
      t.integer :price
      t.datetime :expiration
      t.integer :limit
      t.text :description
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
