class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :ticket_option, index: true
      t.boolean :used, default: false

      t.timestamps
    end
  end
end
