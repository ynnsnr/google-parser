class Analysis < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  validate :validate_keywords
  after_create_commit :scrape_keywords

  def keywords
    raw_keywords.split("\n").map(&:chomp)
  end

  private

  def validate_keywords
    keywords_count = keywords.count
    if keywords_count == 0 || keywords_count > 100
      errors.add :raw_keywords, 'You must specificy between 1 and 100 keywords'
    end
  end

  def scrape_keywords
    keywords.each_with_index do |keyword, index|
      SearchKeywordJob.perform_later id, keyword, index + 1
    end
  end
end
