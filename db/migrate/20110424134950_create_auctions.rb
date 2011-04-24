class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
      t.string :item
      t.string :origin
      t.string :destination
      t.integer :bids
      t.decimal :mileage
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :auctions
  end
end
