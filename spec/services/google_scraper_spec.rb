describe 'GoogleScraper' do
  let(:scraper) { GoogleScraper.new }
  it 'should scrape the links count' do
    expect(scraper.scrape('iphone')[:links_count]).to be_instance_of(Integer)
  end
  it 'should scrape the adwords count' do
    expect(scraper.scrape('iphone')[:adwords_advertiser_count]).to be_instance_of(Integer)
  end
  it 'should scrape the results count' do
    expect(scraper.scrape('iphone')[:results_count]).to be_instance_of(Integer)
  end
  it 'should scrape the html' do
    expect(scraper.scrape('iphone')[:raw_html]).to be_instance_of(String)
  end
end
