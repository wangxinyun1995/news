class CreatePayTotals < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_totals do |t|
      t.string :day
      t.decimal :price
      t.string :where
      t.boolean :is_company, default: false
      t.string :sex, default: 'female'
      t.string :way

      t.timestamps
    end
  end
end
