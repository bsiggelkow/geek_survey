class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.integer :value, :default => 0
      t.string :comment
      t.belongs_to :survey

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
