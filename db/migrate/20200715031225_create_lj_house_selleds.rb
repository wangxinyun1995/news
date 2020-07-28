class CreateLjHouseSelleds < ActiveRecord::Migration[5.1]
  def change
    create_table :lj_house_selleds do |t|
      t.string :lj_house_name
      t.string :info_url
      t.string :desc_name
      t.date :sell_date
      t.decimal :total, precision: 12, scale: 2
      t.decimal :average_price, precision: 12, scale: 2
      t.decimal :listing_price, precision: 12, scale: 2
      t.integer :deal_day
      t.integer :price_diff_time
      t.integer :daikan
      t.integer :star
      t.integer :youlan
      t.text :images
      t.string :room_type
      t.string :floor
      t.decimal :area, precision: 12, scale: 2
      t.string :room_structure
      t.decimal :inner_area, precision: 12, scale: 2
      t.string :build_type
      t.string :look
      t.integer :build_year
      t.string :decoration
      t.string :build_structure
      t.string :property
      t.string :heating
      t.string :elevator
      t.string :is_elevator
      t.string :lj_deal_no
      t.string :deal_ownership
      t.date :listing_time
      t.string :room_age
      t.string :room_ownership
      t.text :deal_record
      t.text :intro
      t.text :yezhu_intro
      t.date :snatch_day

      t.timestamps
    end
  end
end
