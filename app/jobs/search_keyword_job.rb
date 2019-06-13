require 'http'
require 'nokogiri'

class SearchKeywordJob < ApplicationJob
  queue_as :default

  def perform(analysis_id, keyword, position)
    html = HTTP.get('https://www.google.com/search', params: { search: keyword }).to_s
    doc = Nokogiri::HTML(html)
    total_result = doc.find('#resultStats')
    # TODO: count adwords

    result = Result.new(position: position)
    result.analysis_id = analysis_id
    result.raw_html = html
    result.adwords_advertiser_count = total_result
    # TODO: result.links_count
    result.keyword = keyword
    result.save
  end
end
