class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :number
      t.string :title
      t.string :signature_date
      t.string :effective_date
      t.string :expiration_date

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
