class CreateSnatchLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :snatch_logs do |t|
      t.integer :no
      t.string :resource
      t.string :log

      t.timestamps
    end
  end
end
