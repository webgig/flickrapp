class CreateRecentSearches < ActiveRecord::Migration
  def change
    create_table :recent_searches do |t|
      t.string :keyword
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
