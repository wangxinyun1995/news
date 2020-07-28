class CreateLjHouseInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :lj_house_infos do |t|
      t.string :lj_house_id
      t.string :lj_house_url
      t.string :build_year
      t.string :build_type
      t.string :volume_rate
      t.string :greening_rate
      t.string :park_num
      t.string :park_price
      t.string :gas_price
      t.string :water_type
      t.string :electricity_type
      t.string :developer
      t.string :property_company

      t.timestamps
    end
  end
end
