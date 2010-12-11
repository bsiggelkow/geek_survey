class AddUserToSurvey < ActiveRecord::Migration
  def self.up
    change_table :surveys do |t|
      t.belongs_to :user
    end
  end

  def self.down
    remove_column :surveys, :user_id
  end
end
