class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :origin_url
      t.string :resource

      t.timestamps
    end
  end
end
