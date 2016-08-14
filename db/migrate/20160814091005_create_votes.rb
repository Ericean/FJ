class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :voted, :default => false
      t.references :admin, index: true, foreign_key: true
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
