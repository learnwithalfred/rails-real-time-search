class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :ip_address
      t.string :query
      t.string :results_count

      t.timestamps
    end
    add_index :searches, [:created_at]
    add_index :searches, [:query, :created_at], name: "index_searches_on_query"
  end
end
