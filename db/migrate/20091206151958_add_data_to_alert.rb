class AddDataToAlert < ActiveRecord::Migration
  def self.up
    Alert.create :alert_date => "11/10/2009", :title => "Effective Date",  :contract_number => "C-38274", :contract_title => "Seabrook Turbine Retrofit", :contract_id => 1
    Alert.create :alert_date => "11/24/2009", :title => "Expiration Date", :contract_number => "C-38274", :contract_title => "Seabrook Turbine Retrofit", :contract_id => 1
    Alert.create :alert_date => "11/27/2009", :title => "Effective Date",  :contract_number => "C-87321", :contract_title => "Big Y Junction Project",    :contract_id => 3
    Alert.create :alert_date => "02/03/2010", :title => "Expiration Date", :contract_number => "C-87321", :contract_title => "Big Y Junction Project",    :contract_id => 3
  end

  def self.down
  end
end
