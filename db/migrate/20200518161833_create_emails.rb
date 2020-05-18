class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :content
      t.datetime :time

      t.timestamps
    end
  end
end
