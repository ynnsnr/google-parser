class GoogleScraper
  def initialize
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120 # seconds
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-extensions')
    options.add_argument('--window-size=800,600')
    options.add_argument('--headless') # unless Rails.env.development?
    @driver = Selenium::WebDriver.for :chrome,
                                      options: options,
                                      desired_capabilities: capabilities
  end

  def scrape(keyword)
    @driver.navigate.to('https://www.google.com/?hl=en')
    @driver.find_element(name: 'q').send_keys(keyword)
    @driver.find_element(name: 'q').send_keys(:return)
    links = @driver.find_elements(tag_name: 'a')
    results = @driver.find_element(id: 'resultStats').text
    ads_count = @driver.find_elements(class_name: 'ads-ad').count
    ads_count += @driver.find_elements(class_name: 'pla-unit').count
    {
      raw_html: @driver.page_source,
      links_count: links.count,
      adwords_advertiser_count: ads_count,
      results_count: results.match(/(?<count>[\d,]+) results/)[:count].delete(',').to_i
    }
  end

  def quit
    @driver.quit
  end
end
