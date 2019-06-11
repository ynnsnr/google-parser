class Analysis < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  after_create :search_keywords

  private

  def search_keywords
    raw_keywords.split("\n").each do |keyword|
      SearchKeywordJob.perform_later id, keyword
    end
  end
end
