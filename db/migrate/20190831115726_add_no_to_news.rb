class AddNoToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :no, :string
    add_column :news, :hot, :string
    add_column :news, :description, :text
    add_column :news, :image_url, :string
  end
end
