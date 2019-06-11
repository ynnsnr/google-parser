class AddRawKeywordListToAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :analyses, :raw_keywords, :text
  end
end
