class SearchKeywordJob < ApplicationJob
  queue_as :default

  def perform(analysis_id, keyword, position)
    scraper = GoogleScraper.new
    scraping_results = scraper.scrape(keyword)
    scraper.quit

    result = Result.new(scraping_results)
    result.analysis_id = analysis_id
    result.position = position
    result.keyword = keyword
    result.save!
  end
end
