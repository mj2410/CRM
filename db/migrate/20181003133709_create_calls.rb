class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.string :description
      t.datetime :date_time
      t.integer :rank
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
