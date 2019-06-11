class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :analysis, foreign_key: true
      t.string :keyword
      t.integer :adwords_advertiser_count
      t.integer :links_count
      t.text :raw_html

      t.timestamps
    end
  end
end
