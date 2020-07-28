class CreateLjHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :lj_houses do |t|
      t.string :lj_house_id
      t.string :lj_house_url
      t.string :lj_house_name
      t.string :lj_house_chengjiao_url
      t.integer :lj_house_chengjiao_num
      t.string :lj_house_zufang_url
      t.integer :lj_house_zufang_num
      t.integer :month
      t.decimal :average_price
      t.string :lj_house_sell_url
      t.integer :lj_house_sell_num

      t.timestamps
    end
  end
end
