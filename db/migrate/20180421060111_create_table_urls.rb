class CreateTableUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :url_shorters do |t|
      t.text :url
      t.string :url_short 
      t.boolean :expired
      t.integer :visit_count, default: 0
      t.timestamps
    end
    add_index :url_shorters, :url_short, unique: true

  end
end
