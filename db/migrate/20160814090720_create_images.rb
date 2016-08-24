class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :line
      t.integer :number
      t.integer :flag, :default => 0
      t.timestamps null: false
    end
  end
end
