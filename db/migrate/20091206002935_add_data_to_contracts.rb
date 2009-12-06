class AddDataToContracts < ActiveRecord::Migration
  def self.up
    Contract.create :number => "A-38274", :title => "Seabrook Turbine Retrofit", :signature_date => "11-12-2009", :effective_date => "11-10-2009", :expiration_date => "11-24-2009"

    Contract.create :number => "B-4444",  :title => "Test Contract1",            :signature_date => "12-03-2009", :effective_date => "12-04-2009", :expiration_date => "12-24-2010"

    Contract.create :number => "C-9494",  :title => "Test Contract2",            :signature_date => "12-03-2009", :effective_date => "12-05-2009", :expiration_date => "12-24-2011"

    Contract.create :number => "D-87321",  :title => "Big Y Junction Project",   :signature_date => "11-17-2009", :effective_date => "11-27-2009", :expiration_date => "02-03-2010"

  end

  def self.down
  end
end
