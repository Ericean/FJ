class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :line
      t.integer :order
      t.boolean :flag, :default => false
      t.timestamps null: false
    end
  end
end
