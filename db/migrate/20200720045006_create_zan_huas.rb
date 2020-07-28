class CreateZanHuas < ActiveRecord::Migration[5.1]
  def change
    create_table :zan_huas do |t|
      t.string :house_name
      t.integer :index

      t.timestamps
    end
  end
end
