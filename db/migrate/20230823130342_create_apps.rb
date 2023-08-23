class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.references :user,     null: false, foreign_key: true
      t.string :name,         null: false, default: ""
      t.text :content,        null: false
      t.integer :genre_id,    null: false
      t.timestamps
    end
  end
end
