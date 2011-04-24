# == Schema Information
# Schema version: 20110424134950
#
# Table name: auctions
#
#  id          :integer         not null, primary key
#  item        :string(255)
#  origin      :string(255)
#  destination :string(255)
#  bids        :integer
#  mileage     :decimal(, )
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Auction < ActiveRecord::Base
  
  validates :item, :origin, :destination, :mileage, :date, 
            :presence => true
            
  validates :mileage, :numericality => {:greater_than_or_equal_to => 0.01}
  
end
