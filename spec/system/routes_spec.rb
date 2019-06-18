describe 'Routes', type: :routing do
  it 'GET /analyses to analyses#index' do
    expect(get: '/analyses').to route_to(controller: 'analyses', action: 'index')
  end
  it 'GET /analyses to analyses#show' do
    expect(get: '/analyses/1').to route_to(controller: 'analyses', action: 'show', id: '1')
  end
  it 'GET /analyses to analyses#new' do
    expect(get: '/analyses/new').to route_to(controller: 'analyses', action: 'new')
  end
  it 'POST /analyses to analyses#create' do
    expect(post: '/analyses').to route_to(controller: 'analyses', action: 'create')
  end
  it 'POST /analyses/upload to analyses#upload' do
    expect(post: '/analyses/upload').to route_to(controller: 'analyses', action: 'upload', get: :new_csv)
  end
  it 'GET /results to results#index' do
    expect(get: '/results').to route_to(controller: 'results', action: 'index')
  end
  it 'GET /results/1 to results#show' do
    expect(get: '/results/show').to route_to(controller: 'results', action: 'show')
  end
  it 'GET /results/download to results#download' do
    expect(get: '/results/download').to route_to(controller: 'results', action: 'download')
  end
  it 'GET /users/sign_in to devise/sessions#new' do
    expect(get: '/users/sign_in').to route_to(controller: 'devise/sessions', action: 'new')
  end
  it 'POST /users/sign_in to devise/sessions#create' do
    expect(post: '/users/sign_in').to route_to(controller: 'devise/sessions', action: 'create')
  end
  it 'DELET /users/sign_out to devise/sessions#destroy' do
    expect(delete: '/users/sign_out').to route_to(controller: 'devise/sessions', action: 'destroy')
  end
end
