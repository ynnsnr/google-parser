class AddResultsCountToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :results_count, :bigint
  end
end
