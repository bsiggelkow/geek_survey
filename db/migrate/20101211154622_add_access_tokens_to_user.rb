class AddAccessTokensToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :access_token
      t.string :access_secret
    end
  end

  def self.down
    remove_column :users, :access_token
    remove_column :users, :access_secret
  end
end
