class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :content
      t.integer :votesum, :default => 0
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
