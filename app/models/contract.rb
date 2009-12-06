class Contract < ActiveRecord::Base
  has_many :alerts, :dependent => :destroy
end
