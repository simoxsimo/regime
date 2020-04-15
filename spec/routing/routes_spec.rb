require('rails_helper')

RSpec.describe('Routes to', type: :routing) do
  it 'the home page' do
    should route(:get, '/').to('static_pages#home')
  end
  it 'the signup page' do
    should route(:get, '/signup').to('users#new')
  end
  it 'the login page' do
    should route(:get, '/login').to('sessions#new')
  end
  it 'the logout action' do
    should route(:delete, '/logout').to('sessions#destroy')
  end
  it 'the profile page' do
    should route(:get, '/users/1').to('users#show', id: 1)
  end
  it 'the all nutriments page' do
    should route(:get, '/nutriments').to('nutriments#index')
  end
  it 'the new nutriment page' do
    should route(:get, '/nutriments/new').to('nutriments#new')
  end
  it 'the all external nutriments page' do
    should route(:get, '/ext_nutriments').to('nutriments#no_group_index')
  end
  it 'the all groups page' do
    should route(:get, '/groups').to('groups#index')
  end
  it 'the new group page' do
    should route(:get, '/groups/new').to('groups#new')
  end
  it 'the show group page' do
    should route(:get, '/groups/1').to('groups#show', id: 1)
  end
end