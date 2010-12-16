class AddShortenedUrlToSurvey < ActiveRecord::Migration
  def self.up
    change_table :surveys do |t|
      t.string :shortened_url
    end
  end

  def self.down
    remove_column :surveys, :shortened_url
  end
end
