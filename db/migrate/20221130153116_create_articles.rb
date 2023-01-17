class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
