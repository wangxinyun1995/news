class CreateLjHouseSells < ActiveRecord::Migration[5.1]
  def change
    create_table :lj_house_sells do |t|
      t.string :lj_house_name
      t.string :info_url
      t.string :desc_name
      t.decimal :listing_price, precision: 12, scale: 2
      t.decimal :square_price, precision: 12, scale: 2

      t.integer :build_year
      t.string :lj_house_no
      t.string :room_type
      t.string :floor
      t.decimal :area, precision: 12, scale: 2
      t.string :room_structure
      t.decimal :inner_area, precision: 12, scale: 2
      t.string :build_type

      t.string :look
      t.string :build_structure
      t.string :decoration
      t.string :elevator
      t.string :is_elevator
      t.date :listing_date
      t.string :deal_ownership
      t.string :last_deal
      t.string :property
      t.string :room_year
      t.string :room_ownership
      t.string :mortgage_info
      t.string :deed_image
      t.integer :star
      t.text :intro
      t.text :images
      t.date :snatch_day

      t.timestamps
    end
  end
end
