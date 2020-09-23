class CreateXiGuas < ActiveRecord::Migration[5.1]
  def change
    create_table :xi_guas do |t|
      t.string :name
      t.string :zhishu
      t.text :tags
      t.string :fans
      t.integer :read
      t.integer :like
      t.integer :zaikan
      t.integer :comments
      t.integer :articles

      t.timestamps
    end
  end
end
