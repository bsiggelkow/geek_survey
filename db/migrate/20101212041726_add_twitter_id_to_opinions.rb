class AddTwitterIdToOpinions < ActiveRecord::Migration
  def self.up
    change_table :opinions do |t|
      t.integer :twitter_id
    end
  end

  def self.down
    remove_column :opinions, :twitter_id
  end
end
