class AddTwitterIdToSurvey < ActiveRecord::Migration
  def self.up
    change_table :surveys do |t|
      t.integer :twitter_id
    end
  end

  def self.down
    remove_column :surveys, :twitter_id
  end
end
