class Analysis < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy
  after_create :search_keywords
  validates :search_keywords, length: {
    minimum: 1,
    maximum: 100,
    message: 'The file should contains between 1 and 100 keywords'
  }

  private

  def search_keywords
    raw_keywords.split("\n").each_with_index do |keyword, index|
      SearchKeywordJob.perform_later id, keyword, index + 1
    end
  end
end
