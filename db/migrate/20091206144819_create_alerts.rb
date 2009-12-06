class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :alert_date
      t.string :title
      t.string :contract_number
      t.string :contract_title
      t.integer :contract_id

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
