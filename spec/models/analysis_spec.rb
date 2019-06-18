ActiveJob::Base.queue_adapter = :test

describe 'Analysis' do
  it 'should enqueue a SearchKeywordJob on creation' do
    user = User.create(email: 'yoann@saunier.me')
    expect { Analysis.create(raw_keywords: 'iphone', user: user) }
      .to have_enqueued_job(SearchKeywordJob)
  end
  it 'should enqueue 2 SearchKeywordJob on creation' do
    user = User.create(email: 'yoann@saunier.me')
    expect { Analysis.create(raw_keywords: "iphone\r\nsim card", user: user) }
      .to change {
        ActiveJob::Base.queue_adapter.enqueued_jobs.count
      }.by 2
  end
end

describe 'keywords' do
  it 'should parse the list of keywords from raw input' do
    analysis = Analysis.new(raw_keywords: "iphone\r\nsim card")
    expect(analysis.keywords).to eq(['iphone', 'sim card'])
  end
end
